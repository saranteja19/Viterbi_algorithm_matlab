function convEncodedBits = convEncoder(txBits,n,K,g)

txBits = fliplr(txBits);

[~,t] = size(txBits);

memData = [zeros(1,K)];%MEMORY BITS

convCoderData = [txBits,memData];

[~,c] = size(convCoderData);

G = [zeros(n,c-K-1),g];


convEncodedBits = [];

for i = 1:t
    xorOutputs = mod(sum(bitand(G,convCoderData)'),2);
    convEncodedBits = [convEncodedBits,xorOutputs];
    convCoderData = circshift(convCoderData,1);
end
end
