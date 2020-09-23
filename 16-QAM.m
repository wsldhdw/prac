
nbits = 4;
bits = randi([0 15], 1, nbits) 
modbits = pskmod(bits, 16);
figure(1);
plot(modbits, 'rx')
axis([-4,4 ,-4,4]);% bpsk has order 2

t = linspace(0, nbits, 10*nbits); %11 bits per symbol
f = 4; 
fc = 100;
txbits = repelem(modbits, 10); %11 bits per sample
txi= real(txbits).* cos(2*pi*f*t)

txq = imag(txbits) .* sin(2*pi*f*t)
plot(t, txi, '.-')
txOTA= txi+txq;
plot(t, txOTA, '.-r')
rx = txOTA;rxI = rx .* cos(2*pi*f*t);
rxQ = rx .* sin(2*pi*f*t);subplot(2,1,1)
plot (t, rxI, 'r');
subplot(2,1,2);
plot(t, rxQ, 'b');rxIQ = intdump(rxI, 10) + 1i*intdump(rxQ, 10);
pskdemod(rxIQ, 16);