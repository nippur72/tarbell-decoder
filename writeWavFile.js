// scrive un file WAV
function writeWavFile(channelData, sampleRate, name) {
    const WavEncoder = require("wav-encoder");
    const fs = require("fs");
    const wavData = {
       sampleRate,
       channelData
    };

    const buffer = WavEncoder.encode.sync(wavData, { bitDepth: 16, float: false });
    fs.writeFileSync(name, new Buffer(buffer));
}

module.exports = writeWavFile;
