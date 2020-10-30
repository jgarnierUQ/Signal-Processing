# Good Thomas Algorithm Implementation
The Good Thomas Algorithm is another method of implementing a Fast Fourier Transform (FFT), but unlike the Cooley Tukey algorithm, does not use twiddle factors. Instead, it utilises the Chinese Remainder Theorem to index and reindex the data. A high level overview of what is happening is shown in the image below:

<img src="https://github.com/jgarnierUQ/Signal-Processing/blob/main/Good-Thomas%20Algorithm%20Implementation/goodThomasTheory.PNG" alt="drawing" width="700"/>

Similarly to the Cooley Tukey implementation, the code generates an arbitrary signal of multiple sinusoidal components, which the algorithm is then applied to. The result is checked by applying an inbuilt MATLAB DFT function on the same arbitrary signal, and then comparing the outputs.
