%--------------------------------------------------------------------------
% University of Limerick - Dept. of Electronic and Computer Engineering
%--------------------------------------------------------------------------
% filename: Lab1 - part3.m
%
% purpose: Generate 2 Sinousoids and plot results
%
% created by: Tom Meehan
% created on: 16 September 2021
%
%--------------------------------------------------------------------------
% Copyright 2021 University of Limerick
%--------------------------------------------------------------------------
clc;
clear all;
close all;

%% part A
% Fs: Sampling frequency = 8000 Hz
% t: create sample points up to 0.5 sec, spaced 1/Fs apart
Fs=8000;
t=0:1/Fs:0.5;
x1=5*cos(2*pi*500*t);
x2=5*cos(2*pi*1200*t + (pi/4));

figure (1);
subplot(2,1,1);
plot(t,x1); grid;
axis([0 0.01 -6 6])
title('Digital Sinusoids', 'color','r','Fontsize',12);
xlabel('Time (sec)');ylabel('x1\it(t)');

subplot(2,1,2);
plot(t,x2); grid;
axis([0 0.01 -6 6])
xlabel('Time (sec)');ylabel('x2\it(t)');

%% part B
% Multiply the 2 sinusoids
x=x1.*x2;
figure (3);
subplot(2,1,1);plot(t,x); grid;
axis([0 0.01 -25 25])
xlabel('Time (sec)');
ylabel('x1\it(t)+x2\it(t)+x3\it(t)');
title('Sum of digital Sinusoids - Time Domain','Fontsize',12);

%% part C
% Fs: sampling Frequency
% f : frequency index: convert it to Hz using k
Ak=abs(fft(x))/length(x);
Fs=8000;
k=0:1:length(x)-1;
f=k*Fs/length(x);
subplot(2,1,2); plot(f,Ak);
xlabel('Frequency (Hz)');ylabel('Signal Spectrum');
title('Sum of digital Sinusoids - Frequency domain', 'Fontsize',12);

%% part D
pause
sound(x1/max(abs(x1)),8000);pause
sound(x2/max(abs(x2)),8000);pause
sound(x/max(abs(x)),8000);