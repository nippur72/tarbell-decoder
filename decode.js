const fs = require("fs");
const WavDecoder = require("wav-decoder");        // per leggere i .WAV
const writeWavFile = require("./writeWavFile");   // per scrivere i .WAV
const filterSamples = require("./filter");        // applica un filtro passa basso FIR
const thresholdSamples = require("./threshold");
const options = require("./options");

// check command line arguments
if(options.input === undefined || options.output === undefined) {
   console.log("usage: decode -i input.wav -o output.bin [-g]");
   process.exit(-1);
}

const file_input = fs.readFileSync(options.input);
const audioData = WavDecoder.decode.sync(file_input);   
const samples = audioData.channelData[0];               
const samplerate = audioData.sampleRate;                
const freq = 1527;                                      
const bitsize = Math.round(samplerate / freq);

const D1 = derive(samples);

// works best: 400 Hz HP, 12db FIR=38

const AF = filterSamples(samples, samplerate, 44, freq );      // apply low pass filter (16 default)
const TH = thresholdSamples(AF);                               // quantize audio

const { SY, durs, pos, roll } = TH_to_symbols(TH, 21);
let bits = symbols_to_bits(SY);

// Tarbell BASIC: fix bad bit at 60533
// bits.splice(60533,1);

const bytes = bits_to_bytes(bits);
// Tarbell BASIC: const decoded_file = cut_file(bytes);
const decoded_file = bytes;

fs.writeFileSync(options.output, new Uint8Array(decoded_file));

if(options.graph) {
   for(let t=0; t<45; t++) {
      console.log(`${t};${durs[t]}`);
   }   
}

/*
for(let t=0;t<8;t++) {
    bits_sl = bits.slice(t);
    const bytes = bits_to_bytes(bits_sl);
    const decoded_file = bytes;
    fs.writeFileSync(options.output+`.off.${t}.bin`, new Uint8Array(decoded_file));
}
*/

// write wav out
const channelData = [
   samples,
   samples,
   D1,
   AF,
   TH,
   pos,
   roll
];

// e li scrive su su .WAV leggibile con audacity
writeWavFile(channelData, samplerate, "out.wav");

/*************************************************************************/

function TH_to_symbols(TH, threshold) {
    let SY = [];
    let pos = [];
    let roll = [];
    let durs = new Array(255).fill(0);
    let dur = 0;
    let th = threshold;
    let croll = 0;
    for(let t=0; t<TH.length; t++) {
        if(t > 1 && TH[t-1] != TH[t]) {
            durs[dur]++;
            if(dur > th) {
                if(TH[t-1] == 1) { SY.push("H"); SY.push("H"); }
                else             { SY.push("L"); SY.push("L"); }
                pos.push(0.75);
                croll = dur - th;
            }
            else {

                if(dur == 4 && t==875219)
                {
                    // remove bad bit at pos 875219
                    console.log(t);
                    console.log(SY.length);
                }

                if(TH[t-1] == 0) { SY.push("L"); }
                else             { SY.push("H"); }
                pos.push(0.50);
                croll = dur - th;
            }
            dur = 0;
        }
        else {
           dur++;
           pos.push(0);
        }
        roll.push((croll / 50) % 1);
    }
    return { SY, durs, pos, roll };
}

function symbols_to_bits(symbols) {

   // find header $E6
   let start = symbols.join("").indexOf("LLHLHLHHLHLLHLHHLLH");
      
   let bits = [];
   let bitcnt = 0;
   let badbits = false;
   for(let t=start+1+2; t<symbols.length; t+=2) {
      let s = symbols[t-1] + symbols[t];
      let s1 = symbols[t-2];
      if(s=="HH") bits.push(1);
      if(s=="LL") bits.push(0);
      if(s=="HL") bits.push(1);
      if(s=="LH") bits.push(0);

      if(!badbits)
      {
        if(s=="HH" && s1=="H") { console.log(`*** wrong bit at pos ${t}`); badbits = true; }
        if(s=="LL" && s1=="L") { console.log(`*** wrong bit at pos ${t}`); badbits = true; }
        if(s=="LH" && s1=="L") { console.log(`*** wrong bit at pos ${t}`); badbits = true; }
        if(s=="HL" && s1=="H") { console.log(`*** wrong bit at pos ${t}`); badbits = true; }
      }

      bitcnt++;
      // Tarbell BASIC: remove bad bit
      //if(bitcnt == ((0x0aeb - 0x0100)*8)) {
      //   bits.pop();
      //}       
   } 
   return bits;
}

function bits_to_bytes(bits) {
   let bytes = [];
   for(let t=0;t<bits.length;t+=8) {
       let byte =
           (bits[t+0] << 7) |
           (bits[t+1] << 6) |
           (bits[t+2] << 5) |
           (bits[t+3] << 4) |
           (bits[t+4] << 3) |
           (bits[t+5] << 2) |
           (bits[t+6] << 1) |
           (bits[t+7] << 0);
       bytes.push(byte);
   }
   
   //bytes = bytes.slice(1);
   bytes = bytes.slice(0, 0x5900+1);
   return bytes;
}

/*
function cut_file(bytes) {
   let cut = bytes.slice(1);
   cut = cut.slice(0, 0x5900);
   return cut;
}
*/

/****************************************************************************************/

//console.log(bbb.join(""));


// console.log("fine");

/*
let chksum = 0;
for(let t=0;t<bytes.length;t++) {
    chksum = (chksum + bytes[t]) & 0xFFFF;
    console.log(`${t} = ${chksum.toString(16)}`);
}
*/

// let NRZ_orig = audioData.channelData.length > 1 ? audioData.channelData[1] : samples;

/*
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
*/

// const { NRZ, bits } = rebuild_NRZ(TH, CLK, bitsize);

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

/*
// mette inseieme tutti i canali
const channelData = [
    samples,
    AF,
    TH,
    CLK,
    NRZ,
    NRZ_orig
];
*/

/*
// e li scrive su su .WAV leggibile con audacity
writeWavFile(channelData, samplerate, "out.wav");
*/

function derive(samples) {
    return samples.map((e,i)=>{
        if(i==0) return 0;
        else return samples[i]-samples[i-1];
    });
}
