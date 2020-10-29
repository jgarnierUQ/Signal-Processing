# Radix 4 Cooley Tuckey Algorithm Implementation
Written in MATLAB, the Cooley Tuckey Algorithm is a simple way to implement a Fast Fourier Transform (FFT), by essentially breaking down a Discrete Fourier Transform (DFT) into many smaller DFT's. I followed a method outlined by the following diagram:

<img src="https://github.com/jgarnierUQ/Signal-Processing/blob/main/cooleyTukeyTheory.PNG" alt="drawing" width="700"/>

My code generates an arbitrary signal of multiple sinusoidal components, which the algorithm is then applied to. The result is checked by applying an inbuilt MATLAB DFT function on the same arbitrary signal, and then comparing the outputs.
