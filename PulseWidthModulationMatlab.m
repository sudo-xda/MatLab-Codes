clc;
close all;
clear all;
fm=1;
fc=10;
fs=1000*fm;
t=0:0.0001:1;
s=sawtooth(2*pi*fc*t+pi);
m=0.75*sin(2*pi*fm*t);
n=length(s);
for i=1:n
 if (m(i)>=s(i))
  pwm(i)=1;
  elseif (m(i)<=s(i))
    pwm(i)=0;
 end
end
subplot(4,1,1);
plot(t,m)
title('Message signal');
xlabel ('Time');
ylabel('Amplitude');
grid on;
subplot(4,1,2);
plot(t,s);
title('Carrier signal');
xlabel('Time');
ylabel('Amplitude');
grid on;
subplot(4,1,3);
plot(t,pwm);
title('pwm signal');
xlabel('Time');
ylabel('Amplitude');
grid on;
axis([0 1 -1.5 1.5]);
demosig=demod(pwm,fm,fs,'pwm');
subplot(4,1,4);
plot(demosig);
title('Demodulated Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;

