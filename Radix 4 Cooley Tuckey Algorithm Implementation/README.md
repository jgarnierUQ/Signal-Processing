# Radix 4 Cooley Tuckey Algorithm Implementation
The Cooley Tuckey Algorithm is a simple way to implement a Fast Fourier Transform (FFT), by essentially breaking down a Discrete Fourier Transform (DFT) into many smaller DFT's. I wrote an implementation in MATLAB using the method outlined by the following diagram:

<img src="https://github.com/jgarnierUQ/Signal-Processing/blob/main/Radix%204%20Cooley%20Tuckey%20Algorithm%20Implementation/cooleyTukeyTheory.PNG" alt="drawing" width="700"/>

My code generates an arbitrary signal of multiple sinusoidal components, which the algorithm is then applied to. The result is checked by applying an inbuilt MATLAB DFT function on the same arbitrary signal, and then comparing the outputs.
