const fs = require("fs");
const WavDecoder = require("wav-decoder");        // per leggere i .WAV
const writeWavFile = require("./writeWavFile");   // per scrivere i .WAV
const filterSamples = require("./filter");        // applica un filtro passa basso FIR
const quadrature = require("./quadrature");       // estrae I e Q con un quadrature detector

const file_input_name = "test.wav";                     // il file da processare
const file_input = fs.readFileSync(file_input_name);
const audioData = WavDecoder.decode.sync(file_input);
const samples = audioData.channelData[0];               // i campioni audio -1.0 .. 1.0
const samplerate = audioData.sampleRate;                // 44100

// 1500 Hz nominali, 1527 è il valore che da meno drift di fase
const freq = 1527;

// estrae i segnali I e Q dai campioni audio
let { I, Q } = quadrature( samples, samplerate, freq );

// filtra LP i segnali I e Q
I = filterSamples(I, samplerate, 256, freq);
Q = filterSamples(Q, samplerate, 256, freq);

let A = [];     // ampiezza del segnale (non usata per ora)
let P = [];     // fase assoluta del segnale
let D = [];     // fase differenziale
let B = [];     // "soft" bit, da 0.0 a 1.0
let CLK = [];   // un segnale di riferimento per facilitare la visione su Audacity

let bitsize = Math.round(samplerate / freq);  // 28,  lunghezza di un bit in campioni
let bitsizef = samplerate / freq;             // 28.8 lunghezza di un bit (non arrotondata)

// processa i segnali I e Q generando i vettori A,P,D,B
let clk = 0;
for(let t=0; t<samples.length; t++) {

    let i = I[t];
    let q = Q[t];

    let ph = (i==0.0 && q==0.0) ? 0.0 : Math.atan2(i, q);      // fase
    let ampl = Math.sqrt(i*i + q*q);                           // ampiezza

    // calcola fase un bit più indietro
    let last_i = t>bitsize ? I[t-bitsize] : 0;
    let last_q = t>bitsize ? Q[t-bitsize] : 0;
    let lastph = (last_i==0.0 && last_q==0.0) ? 0.0 : Math.atan2(last_i, last_q);

    // calcola la fase differenziale
    let dph = (ph - lastph);
    if(dph < 0) dph += 2.0 * Math.PI;

    // calcola il soft bit: 0=bit zero, PI=bit 1
    let bit;
    if(dph < Math.PI) bit = dph / Math.PI;
    else              bit = 1 - (dph - Math.PI)/ Math.PI;

    // accoda i valori calcolati nei relativi vettori
    A.push(ampl * 4);
    P.push(ph / (2.0 * Math.PI));
    D.push(dph / (2.0 * Math.PI));
    B.push(bit / 2);

    // mette un segnale di clock "visivo" nel progetto Audacity
    if(t>clk) {
        CLK.push(0.75);
        clk+= bitsizef;
    }
    else CLK.push(0);
}

// filtra ulteriormente i soft bit per un segnale più smooth
let bitfi = filterSamples(B, samplerate, 256, freq);

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
    bitfi
];

// e li scrive su su .WAV leggibile con audacity
writeWavFile(channelData, samplerate, "out.wav");

console.log("fine");
