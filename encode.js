function encode_bits(bits, samplerate, bitsize) {
   let samples = [];
   
   for(let t=0;t<bits.length;t++) {
      for(let j=0; j<bitsize; j++) {
         let clk = j < bitsize / 2 ? 1 : 0;
         let s = clk ^ bits[t];
         samples.push(s ? 0.75 : -0.75);
      }     
   }

   return new Float32Array(samples);
}

function bytes_to_bits(bytes) {
   let bits = [];

   for(let t=0;t<bytes.length;t++) {
      let b = bytes[t];
      for(let j=0; j<8; j++) {
         let bit = b & (1<<j) ? 1 : 0;
         bits.push(bit);
      }     
   }   

   return bits;
}

const writeWavFile = require("./writeWavFile");   // per scrivere i .WAV

const fs = require("fs");
const file_input_name = "prova.bin";  
const file_input = fs.readFileSync(file_input_name);

let buffer = [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, ...file_input];

let bits = bytes_to_bits(buffer);
let samplerate = 44100;
let bitrate = 1500;
let bitsize = Math.round(samplerate/bitrate);
let samples = encode_bits(bits, samplerate, bitsize);

let channelData = [ samples ];

// e li scrive su su .WAV leggibile con audacity
writeWavFile(channelData, samplerate, "encoded.wav");

