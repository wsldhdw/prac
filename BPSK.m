
nbits=4;
bits = randi([0,1], 1 , nbits);
modbits = pskmod(bits,2);
t = linspace(0, nbits, 51*nbits);
f = 4;
txbits = oversample(modbits, 51);

txi= real(txbits).* cos(2*pi*f*t);
txq= imag(txbits).* sin(2*pi*f*t);
subplot(2,2,1)
plot(t, txi, '.-')
txOTA= txi+txq;
subplot(2,2,2)
plot(t, txOTA, '.-r')

rx = txOTA;
rxI = rx .* cos(2*pi*f*t);
rxQ = rx .* sin(2*pi*f*t);
subplot(2,2,3)
plot(t, rxI, 'r');
subplot(2,2,4)
plot(t, rxQ, 'b');

rxIQ = intdump (rxI, 51) + 1i* intdump(rxQ, 51);
pskdemod(rxIQ,2)
