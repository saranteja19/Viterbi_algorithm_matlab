# Viterbi_algorithm_matlab
**Project Title: Viterbi Algorithm Implementation for Convolutional Coding**

**Project Overview:**
In this project, I implemented the Viterbi algorithm for convolutional coding using MATLAB. The goal was to design an efficient communication system capable of encoding and decoding digital data to combat errors that might occur during transmission. The project was divided into three main components, each encapsulated in a dedicated MATLAB script.

1. **convEncoder.m**:
   - The `convEncoder` script implemented the convolutional encoder. It accepts an input bit sequence, performs convolutional encoding using a specified generator polynomial, and generates an encoded bit sequence. The script efficiently utilizes matrix operations to encode the data.

2. **conDecoder.m**:
   - The `conDecoder` script focused on the Viterbi decoding process. It utilized the Viterbi algorithm to decode received bits efficiently. The algorithm considered transition states and outputs to estimate the most likely sequence of transmitted bits, effectively correcting errors introduced during transmission.

3. **CONVmain.m**:
   - The `CONVmain` script served as the main program for testing the encoder and decoder. It allowed for the simulation of the entire communication system. Input bits were encoded, subjected to simulated noise, and subsequently decoded using the Viterbi algorithm.

**Technologies and Techniques Employed:**
- MATLAB programming for algorithm implementation.
- Convolutional encoding using specified generator polynomials.
- Viterbi algorithm for decoding and error correction.
- Simulation of noise and error-prone communication channels.

**Key Achievements:**
- Successfully implemented the Viterbi algorithm for convolutional coding.
- Developed an end-to-end communication system capable of encoding and decoding digital data efficiently.
- Tested and validated the system's error correction capabilities through noise simulation.

This project showcases my proficiency in MATLAB programming, digital communication systems, and error-correcting codes, which can be valuable additions to my resume, highlighting my skills in algorithm implementation and error mitigation in communication systems.
