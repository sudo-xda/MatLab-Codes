clc;
clear all;
close all;
fc=1000; %CARRIER FREQUENCY
fs=10000; %SAMPLING FREQUENCY
fm=200;    %MESSAGE FREQUENCY
t=0:1/fs:((2/fm)-(1/fs));
X= 0.4*cos(2*pi*fm*t)+0.5;%MESSAGE SIGNAL
Y= modulate(X,fc,fs,'PPM');
subplot(3,1,1);
plot(X);
title('Message Signal');
subplot(3,1,2);
plot(Y);
axis([0 500 -0.2 1.2]);
title('PPM Modulated Signal');
xlabel('Time');
ylabel('Amplitude');
demoddi=demod(Y,fc,fs,'ppm');
subplot(3,1,3);
plot(demoddi);
title('PPM Demod');
xlabel('Time');
ylabel('Amplitude');

