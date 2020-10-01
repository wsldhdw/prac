clc;clear;
x = read_complex_byte('freqAd.bin');

plot(abs(x(61954:61954+639)));
%8641 is the interval between two start point 
%when charge the starting point the recover signal's pahse will also charge
s_start1 = 36031;
s_start2 = 10110;
s_start3 = 18750;
s_start4 = 1469;
s_start5 = 27392;
 signal1=x(s_start5:s_start5+639);
fs = 2*(10^6);
t = 0:1/fs:(length(signal1)-1)/fs;
signal_fixed = signal1.*exp(1j*2*pi*6600*t.') ;

iqdata = intdump(signal_fixed,16);
p1 = pskdemod(iqdata,4)'; 
p2 = pskdemod(1j*iqdata,4)';
p3 = pskdemod(-1*iqdata,4)'; 
p4 = pskdemod(-1j*iqdata,4)'; 
g=[];g1=[];
for i= 1:5
    g=[g,1 4 16 64];
    g1=[g1,64 16 4 1];
end
x1=p1(1:20).*g ;xx1=p1(21:40).*g1;
x2=p2(1:20).*g ;xx2=p2(21:40).*g1;
x3=p3(1:20).*g ;xx3=p3(21:40).*g1;
x4=p4(1:20).*g ;xx4=p4(21:40).*g1;

ps=xx2;
ps1=x2;
p11=0;p12=0;p41=0;p31=0;p21=0;
p13=0;p14=0;p15=0;p51=0;p01=0;
for o=1:4
    p11=ps(o)+p11;
    p01=ps1(o)+p01;
end
for o=5:8
    p12=ps(o)+p12;
    p21=ps1(o)+p21;
end
for o=9:12
    p13=ps(o)+p13;
    p31=ps1(o)+p31;
end
for o=13:16
    p14=ps(o)+p14;
    p41=ps1(o)+p41;
end
for o=17:20
    p15=ps(o)+p15;
    p51=ps1(o)+p51;
end
% % 
char(p11)
char(p12)
char(p13)
char(p14)
char(p15)
char(p01)
char(p21)
char(p31)
char(p41)
char(p51)
%s_start2 :7410.
%s_start3 :hello
%s_start1 :4105,
%s_start4 :4105,
%s_start5 :comms