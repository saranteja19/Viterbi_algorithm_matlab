clc;
clearvars;
close all;


txBits = [0,1,0,0,0,0,0,0,1,0,1,0,0,0];
%txBits = [1,0,1,0,0,0];
%txBits = [1,0,1,1,0,0];

g = [1,0,1;1,1,1];% XOR CONFIGs

n = 2; k = 1; K = 2;


%% VITERBI ENCODING
convEncodedBits = convEncoder(txBits,n,K,g);

%% NOISE%
%rxBits = mod(convEncodedBits + [0,0,0,0,1,0,1,0,1,0,0,0],2);
rxBits = convEncodedBits;
%% VITERBI DECODING
[convDecodedBits,outputBits] = convDecoder(rxBits);


%% CHECKER
% msg=[1 0 1 1 0 0];
% trel = poly2trellis(3,[5 7]);
% rx1 = convenc(msg,trel)
