function [convDecodedBits,outputBits] = convDecoder(rxBits)

tStates = [0,0;1,0;2,1;3,1;0,2;1,2;2,3;3,3];        %TRANSITION STATES
tOutputs = [0 3 1 2 3 0 2 1]';                      %T-OUTPUTS

buff = [[0 0;5 5;5 0;5 5;0 0;5 5;5 0;5 5],zeros(length(tOutputs),length(rxBits)/2 -2)];

relHammDist = [];

intRx = dec2bin(bit2int(rxBits',2),2)-48;           % INTEGER VALUE OF GROUPED Rx BITS
binToutputs = reshape(int2bit(tOutputs,2),2,[])';   % BINARY T-OUTPUTS

for ii = 1:length(rxBits)/2
    hamDist = abs(binToutputs-intRx(ii,:));
    relHammDist = [relHammDist,sum(hamDist')'];
end
relHammDist = relHammDist + buff;                   %ADDING EXTRA BUFFER WEIGHT TO THE UNWANTED STATE OUTPUTS

statesPath = 0;

w = length(rxBits)/2 -1;
for i = 1:w
    path1 = relHammDist(2*statesPath(1,i) +1,w+2-i);
    path2 = relHammDist(2*statesPath(1,i) +2,w+2-i);
    z = mod(2*statesPath(1,i) +1,4);
if path1==path2
    %WHEN PATHS ARE EQUALLY ERRORED,CONSIDER ALL POSSIBILITIES FOR NXT
    %STATE AND REPEAT THE SAME . FROM THERE DECIDE THE NXT STATES OF
    %PREVIOUS ITERRATIONS
    [~, indice] = min(relHammDist(2*z -1:2*z +2,w+1-i));
    if indice > 2
            nxtState = 2*statesPath(1,i) +2;
    else
            nxtState = 2*statesPath(1,i) +1;
    end
%CHOOSE LESS ERRORED PATH AND ASSIGN IT TO NXT STATE
elseif path1>path2
    nxtState = 2*statesPath(1,i) +2;
elseif path1<path2
    nxtState = 2*statesPath(1,i) +1;
end

statesPath = [statesPath,tStates(nxtState,1)];

end

statesPath=[0,fliplr(statesPath)];

convDecodedBits = [];


for jj = 1:length(statesPath)-1
    for kk = 1:length(tStates)
        if statesPath(1,jj:jj+1) == tStates(kk,:)
            convDecodedBits = [convDecodedBits,tOutputs(kk)];

        end

    end
end

binStatesPath = dec2bin(statesPath',2);
outputBits = binStatesPath(2:length(statesPath),1)';
convDecodedBits = reshape(dec2bin(convDecodedBits,2)',1,[]);
end
