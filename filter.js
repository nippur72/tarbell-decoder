var Fili = require('fili');

// applica un filtro passa basso di tipo FIR
// samples: il vettore con i campioni audio da filtrare
// samplerate: il sample rate dell'audio
// order: la grandezza del filtro FIR (numero di taps)
// cutoff: frequenza di taglio del filtro LP
//
// restituisce un vettore con i campioni filtrati
//
function filterSamples(samples, samplerate, order, cutoff) {
    const calc = new Fili.FirCoeffs();

    // calculate filter coefficients
    var coeff = calc.lowpass({
        order: order,
        Fs: samplerate,
        Fc: cutoff
    });

    let filter = new Fili.FirFilter(coeff);

    let filtered = filter.multiStep(samples);

    return filtered;
}

module.exports = filterSamples;
