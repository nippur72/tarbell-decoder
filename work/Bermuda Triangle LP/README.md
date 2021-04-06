# Bermuda Triangle LP

Some notes on how I did decode the two hidden messages.

I used the samples from the "CD" set, which are better than the "LP" version.

First I tried to decode the usual way (a little of high and low pass filtering) but I was unable to find a good set of filter parameters. The problem was that the audio was too "wavy" making zero cross detection fail in most of the cases.

There was a bit of discussion about this recording and the Tarbell cassette format in this forum thread:

http://www.vcfed.org/forum/showthread.php?79528-Audio-cassette-formats

To eliminate the "waviness" of the signal, I calculated the differential of the signal (corresponding to fist derivate in calculus); in other word it's simply sample[n+1]-samples[n]. That completely changed the shape of the waveform but elimitated the waviness completely.

The differential signal was still noisy so I applied a 4000 Hz low pass filter (6dB) in Audacity; the number 4000 was chosen because the Tarbell format has a bandwidth of approx 3000 Hz.

The filtered differential signal was then processed with the utility program.

First step is the application of a 1500 Hz, 44-tap, low pass FIR filter. This restores a smoothed version of the original signal that was sent to the cassette interface (1500 Hz being the data rate).

The smoothed signal was then quantized to make a 0/1 digital version by simply applying a threshold over 0.

You can clearly see these steps if you open the file "Face B CD Audacity.aup" in Audacity:
- "source" is the differential filtered
- "lowpass" is the smoothed version after the FIR filter
- "rectified" is the 0/1 quantized
- "clock recovered" shows where the clock was detected by the decoding program
- "clock drift" is a metric that shows how a single pulse deviates from the standard length

The decoding. I did not use the method implemented in the hardware interface and explained
in the Tarbell Cassette Interface manual. In software it is much simpler.

According to the Tarbell format, which is manchester encoded, an "HL" pulse (high->low) corresponds to bit "0" and "LH" to bit 1. So the program first look at pulses ranking them into "H" or "L", depending on their length. After that, single bits are created according to the above mentioned schema.

In the next step, groups of 8 bits are assembled into bytes and finally written to file.

With face A I had to invert the polarity of the Waveform in order to decode it (Audacity: "invert" option). Face B is normal polarity.












