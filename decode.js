const fs = require("fs");
const WavDecoder = require("wav-decoder");        // per leggere i .WAV
const writeWavFile = require("./writeWavFile");   // per scrivere i .WAV
const filterSamples = require("./filter");        // applica un filtro passa basso FIR
const decode_bpsk = require("./bpsk-decode");
const thresholdSamples = require("./threshold");

const file_input_name = "test.wav";                     // il file da processare
//const file_input_name = "encoded.wav";                     // il file da processare
const file_input = fs.readFileSync(file_input_name);
const audioData = WavDecoder.decode.sync(file_input);
const samples = audioData.channelData[0];               // i campioni audio -1.0 .. 1.0
const samplerate = audioData.sampleRate;                // 44100
const freq = 1527;                                      // 1500 Hz nominali, 1527 è il valore che da meno drift di fase
const bitsize = Math.round(samplerate / freq);          // lunghezza di un bit in campioni

let NRZ_orig = audioData.channelData.length > 1 ? audioData.channelData[1] : samples;

// const { A, I, Q, P, D, B, BF, CLK } = decode_bpsk(samples, samplerate, freq );

// decode as per Tarbell instructions
const AF = filterSamples(samples, samplerate, 32, freq );

const TH = thresholdSamples(AF);

function rebuild_CLK_old(samples, bitsize) {
    let CLK = [];
    let dur = 0;
    let clk = 0;

    for(let t=0; t<samples.length; t++) {

        clk++;
        if(clk > bitsize) {
            clk -= bitsize;
            bit = samples[t];
        }

        if(clk < bitsize/2) CLK.push(1); else CLK.push(0);

        if(t>1 && samples[t] != samples[t-1]) {
            if(dur > (3*bitsize/4))
            clk = bitsize-1;
            dur = 0;
        }
        else {
            dur++;
        }
    }

    return CLK;
}

function rebuild_CLK(samples, bitsize) {
    let CLK = [];
    let dur = 0;
    let clk_cnt = 0;
    let clk_state = 0;

    for(let t=0; t<samples.length; t++) {

        if(t>1 && samples[t] != samples[t-1]) {
            if(dur > (3*bitsize/4)) clk_state = 1;
            else                    clk_state = ~clk_state & 1;
            dur = 0;
            clk_cnt = 0;
        }
        else dur++;

        if(clk_cnt > (bitsize/2) ) {
            clk_cnt -= bitsize/2;
            clk_state = ~clk_state & 1;
        }

        CLK.push(clk_state);
    }

    return CLK;
}

function rebuild_NRZ(TH, CLK, bitsize) {
    let NRZ = [];
    let bit = 0;
    let bits = [];

    for(let t=0; t<TH.length; t++) {
        if(t > 1 && CLK[t-1] == 0 && CLK[t] == 1) {
            bit = TH[t];
            bits.push(bit);
        }

        NRZ.push(bit);
    }

    return { NRZ, bits };
}

const CLK = rebuild_CLK(TH, bitsize);

const { NRZ, bits } = rebuild_NRZ(TH, CLK, bitsize);


function TH_to_symbols(TH, bitsize) {
    let SY = [];
    let dur = 0;
    for(let t=0; t<TH.length; t++) {
        if(t > 1 && TH[t-1] != TH[t]) {
            if(dur > 3*bitsize/4) {
                if(TH[t-1] == 1) { SY.push("H"); SY.push("H"); }
                else             { SY.push("L"); SY.push("L"); }
            }
            else {
                if(TH[t-1] == 0) { SY.push("L"); }
                else             { SY.push("H"); }
            }
            dur = 0;
        }
        else dur++;
    }
    return SY;
}


/*
// mette inseieme tutti i canali
const channelData = [
    samples,
    samples,
    I,
    Q,
    A,
    P,
    D,
    B,
    CLK,
    BF
];
*/

// mette inseieme tutti i canali
const channelData = [
    samples,
    AF,
    TH,
    CLK,
    NRZ,
    NRZ_orig
];

// e li scrive su su .WAV leggibile con audacity
writeWavFile(channelData, samplerate, "out.wav");

const bbb = TH_to_symbols(TH, bitsize);

let start = bbb.join("").indexOf("LLHLHLHHLHLLHLHHLLH");
console.log(start);

let bbits = [];
for(let t=start+1+2;t<bbb.length;t+=2) {
    let s = bbb[t-1] + bbb[t];
    if(s=="HH") bbits.push(1);
    if(s=="LL") bbits.push(0);
    if(s=="HL") bbits.push(1);
    if(s=="LH") bbits.push(0);
}

console.log(bbits.join(""));

let bytes = [];
for(let t=0;t<bbits.length;t+=8) {
    let byte =
        (bbits[t+0] << 7) |
        (bbits[t+1] << 6) |
        (bbits[t+2] << 5) |
        (bbits[t+3] << 4) |
        (bbits[t+4] << 3) |
        (bbits[t+5] << 2) |
        (bbits[t+6] << 1) |
        (bbits[t+7] << 0);
    bytes.push(byte);
}

fs.writeFileSync("out.bin", new Uint8Array(bytes));

//console.log(bbb.join(""));

console.log("fine");
