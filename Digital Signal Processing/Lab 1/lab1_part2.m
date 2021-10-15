%--------------------------------------------------------------------------
% University of Limerick - Dept. of Electronic and Computer Engineering
%--------------------------------------------------------------------------
% filename: Lab1 - part2.m
%
% purpose: Generate 3 Sinousoids and plot results
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
x3=5*cos(2*pi*1800*t + (pi/2));

% Another way for a sinewave of N samples with fo=1200Hz and Fs =8000Hz.
%fo=1200;Fs=8000;
%x4 = 5*(sin(2*fo*pi*[1:1:N]/Fs);

figure (1);
subplot(3,1,1);
plot(t,x1); grid;
axis([0 0.01 -6 6])
title('Digital Sinusoids', 'color','r','Fontsize',12);
xlabel('Time (sec)');ylabel('x1\it(t)');

subplot(3,1,2);
plot(t,x2); grid;
axis([0 0.01 -6 6])
xlabel('Time (sec)');ylabel('x2\it(t)');

subplot(3,1,3);
plot(t,x3); grid;
axis([0 0.01 -6 6])
xlabel('Time (sec)');ylabel('x3\it(t)');

%% part B
% Add the 3 sinusoids
x=x1+x2+x3;
figure (3);
subplot(2,1,1);plot(t,x); grid;
axis([0 0.01 -16 16])
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
sound(x3/max(abs(x3)),8000);pause
sound(x/max(abs(x)),8000);