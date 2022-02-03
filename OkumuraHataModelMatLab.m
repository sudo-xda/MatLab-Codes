clc;
clear all;
close all;
fc=1500;% frequency of transmission in MHz
fc2=150;
hb= 70;% effective height of transmitting base station antenna in meters
hm=1.5;% effective receiving mobile device antenna height in meters
hm1=(1.1*log10(fc)-0.7)*hm-(1.56*log10(fc)-0.8);%Open
hm2=8.29*(log10(1.54*hm))^2-1.1;%Metropolitan fc<200
hm3=3.2*(log10(11.75*hm))^2-4.92;%Metropolitan fc>200
C=-2*(log10(fc/28))^2-5.4;
C2=-4.78*(log10(fc))^2+18.33*log10(fc)-40.98;
C3=0;
d = (1:50:100);
A=69.55+26.16*log10(fc)-13.82*log10(hb)-hm1;%Open 
A2=69.55+26.16*log10(fc2)-13.82*log10(hb)-hm2;%Metropolitan fc<=200
A3=69.55+26.16*log10(fc)-13.82*log10(hb)-hm3;%Metropolitan fc>=200
B=44.9-6.55*log10(hb);
Plopen=A+B*log10(d)+C %Suburban
Plsub=A+B*log10(d)+C2 %Open
%Plmp1=A2+B*log10(d)+C3 %Metropolitan fc<=200
Plmp2=A3+B*log10(d)+C3 %Metropolitan fc>=200
plot(d,Plopen,d,Plsub,d,Plmp2,'linewidth',2.5);
legend('Suburban','Open','Metropolitan')
title('Path-Loss for diffrent Envirnment ')
xlabel('Distance')
ylabel('Path-Loss in dB')
grid on

