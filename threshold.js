function thresholdSamples(samples) {

    let TH = [];
    for(let t=0; t<samples.length; t++) {
        let s = samples[t] > 0 ? 1 : 0;
        TH.push(s);
    }

    return TH;
}

module.exports = thresholdSamples;