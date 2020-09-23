%%BPSK modulated signal
nbits = 4;
bits = randi([0 3], 1, nbits) 
modbits = pskmod(bits, 4)
figure(1);
plot(modbits, 'rx')
axis([-4,4 ,-4,4]);% bpsk has order 2
% for instance, if I wanted to use QPSK the following
% lines will be used:
% bits = randi([0 3], 1, nbits);
% modbits = pskmod(bits, 4);
% will need to convert the bits to symbols to use QPSK% to make a time domain function use linspace
% in linspace, the third argument is the # of samples, currently 2 bit per
% sample. one bit per sample will not create a waveform
t = linspace(0, nbits, 10*nbits); %11 bits per symbol
f = 4; %Rb = 25, Fc=100 - ratio of 4
fc = 100;
txbits = repelem(modbits, 10); %11 bits per sample
%txi = real(txbits) .* cos(2*pi*f*t);
txq = imag(txbits) .* sin(2*pi*f*t);plot(t, txi, '.-')
% to plot the energy of the signal use:
% plot(abs(x(1:size(samples of signal)))
%txOTA = txi+txq;
plot(t, txOTA, '.-r')
rx = txOTA;rxI = rx .* cos(2*pi*f*t);
rxQ = rx .* sin(2*pi*f*t);subplot(2,1,1)
plot (t, rxI, 'r');
subplot(2,1,2);
plot(t, rxQ, 'b');rxIQ = intdump(rxI, 10) + 1i*intdump(rxQ, 10);
pskdemod(rxIQ, 4);