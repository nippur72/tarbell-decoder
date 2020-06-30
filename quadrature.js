// quadrature detector
//
// moltiplica il vettore in ingresso per SIN e COS
// alla frequenza specificata
//
// restituisce la coppia di vettori { I, Q }
//

function quadrature(samples, samplerate, freq) {
    let ph=0;
    let I = [];
    let Q = [];
    for(let t=0;t<samples.length; t++) {

        let s = samples[t];
        let i = Math.sin(ph) * s;
        let q = Math.cos(ph) * s;

        I.push(i);
        Q.push(q);

        // advance phase
        ph += 2.0 * Math.PI * freq / samplerate;
        ph = ph % (2.0 * Math.PI);
    }

    return { I, Q };
}

module.exports = quadrature;