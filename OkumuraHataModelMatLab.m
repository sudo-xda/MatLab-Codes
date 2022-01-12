clc;
clear all;
close all;
fc=1500;%input('Enter  frequency of transmission in MHz: ');
fc2=500;
hb= 70;%input('Enter effective height of transmitting base station antenna in meters');
hm=1.5;%input('Enter effective receiving mobile device antenna height in meters');
hm1=(1.1*log10(fc)-0.7)*hm-(1.56*log10(fc)-0.8);%Open%input('mobile antenna height correction factor that depends on the environment');
hm2=8.29*(log10(1.54*hm))^2-1.1;%Metropolitan fc<200
hm3=3.2*(log10(11.75*hm))^2-4.92;%Metropolitan fc<200
%suburban
C=-2*(log10(fc/28))^2-5.4;%input('factor used to correct the formulas for open rural and suburban areas');
C2=-4.78*(log10(fc))^2+18.33*log10(fc)-40.98;
C3=0;
d = (1:50:100);
A=69.55+26.16*log10(fc)-13.82*log10(hb)-hm1;%Open 
A2=69.55+26.16*log10(fc)-13.82*log10(hb)-hm2;%Metropolitan fc<200
A3=69.55+26.16*log10(fc2)-13.82*log10(hb)-hm3;%Metropolitan fc<200
B=44.9-6.55*log10(hb);
Pl=A+B*log10(d)+C
Pl1=A+B*log10(d)+C2
Pl2=A2+B*log10(d)+C3
Pl3=A3+B*log10(d)+C3
plot(d,Pl,d,Pl1,d,Pl2,d,Pl3);
title('Path-Loss for diffrent Envirnment ')
xlabel('Distance')
ylabel('Path-Loss in dB')
grid on
%copyright 