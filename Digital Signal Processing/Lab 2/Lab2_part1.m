%--------------------------------------------------------------------------
% University of Limerick - Dept. of Electronic and Computer Engineering
%--------------------------------------------------------------------------
% filename: Lab2 - part1.m
%
% purpose: Sampling a sinusoid and alias effect within the power spectrum
%
% created by: Tom Meehan
% created on: 23 September 2021
%
%--------------------------------------------------------------------------
% Copyright 2021 University of Limerick
%--------------------------------------------------------------------------
clc
clear
close all

%% @fo = 610Hz

Fs=1000;
fo1=610;
N=2048;
x1 = cos(2*pi*fo1*[1:1:N]/Fs);
figure (1);
subplot(2,1,1);
stem(x1); grid
axis([0 N-1 -1.5 1.5])
str1 = sprintf('%d Hz signal sampled at Fs=%d Hz', fo1,Fs);
title(str1,'Fontsize',12)
xlabel('Sample no.');ylabel('x\it(t)');

%--------------------------------------------------------------------------
% Part 1b: Calculate the FFT to translate the signal into the frequency
% domain and view the signal power spectrum from 0Hz to Fs/2.
%--------------------------------------------------------------------------

Ak=abs(fft(x1))/length(x1); % do a FFT
Ak(2:N)=2*Ak(2:N); % convert to one side spectrum
Pk=Ak.*Ak; % compute power spectrum
f=[0:1:N/2]*Fs/N; % map the frequency bin to Hz
subplot(2,1,2); plot(f,Pk(1:N/2+1));grid
xlabel('Frequency (Hz)');ylabel('Power Spectrum');

%% @fo = 790Hz

Fs=1000;
fo2=790;
N=2048;
x2 = cos(2*pi*fo2*[1:1:N]/Fs);

figure (2);
subplot(2,1,1);
stem(x2); grid
axis([0 N-1 -1.5 1.5])
str2 = sprintf('%d Hz signal sampled at Fs=%d Hz', fo2,Fs);
title(str2,'Fontsize',12)
xlabel('Sample no.');ylabel('x\it(t)');

%--------------------------------------------------------------------------
% Part 1b: Calculate the FFT to translate the signal into the frequency
% domain and view the signal power spectrum from 0Hz to Fs/2.
%--------------------------------------------------------------------------

Ak=abs(fft(x2))/length(x2); % do a FFT
Ak(2:N)=2*Ak(2:N); % convert to one side spectrum
Pk=Ak.*Ak; % compute power spectrum
f=[0:1:N/2]*Fs/N; % map the frequency bin to Hz
subplot(2,1,2); plot(f,Pk(1:N/2+1));grid
xlabel('Frequency (Hz)');ylabel('Power Spectrum');

%% @fo = 430Hz

fo3=430;
N=2048;
x3 = cos(2*pi*fo3*[1:1:N]/Fs);

figure (3);
subplot(2,1,1);
stem(x3); grid
axis([0 N-1 -1.5 1.5])
str3 = sprintf('%d Hz signal sampled at Fs=%d Hz', fo3,Fs);
title(str3,'Fontsize',12)
xlabel('Sample no.');ylabel('x\it(t)');

%--------------------------------------------------------------------------
% Part 1b: Calculate the FFT to translate the signal into the frequency
% domain and view the signal power spectrum from 0Hz to Fs/2.
%--------------------------------------------------------------------------

Ak=abs(fft(x3))/length(x3); % do a FFT
Ak(2:N)=2*Ak(2:N); % convert to one side spectrum
Pk=Ak.*Ak; % compute power spectrum
f=[0:1:N/2]*Fs/N; % map the frequency bin to Hz
subplot(2,1,2); plot(f,Pk(1:N/2+1));grid
xlabel('Frequency (Hz)');ylabel('Power Spectrum');

%% @fo = 1100Hz

fo4=1100;
N=2048;
x4 = cos(2*pi*fo4*[1:1:N]/Fs);

figure (4);
subplot(2,1,1);
stem(x4); grid
axis([0 N-1 -1.5 1.5])
str4 = sprintf('%d Hz signal sampled at Fs=%d Hz', fo4,Fs);
title(str4,'Fontsize',12)
xlabel('Sample no.');ylabel('x\it(t)');

%--------------------------------------------------------------------------
% Part 1b: Calculate the FFT to translate the signal into the frequency
% domain and view the signal power spectrum from 0Hz to Fs/2.
%--------------------------------------------------------------------------

Ak=abs(fft(x4))/length(x4); % do a FFT
Ak(2:N)=2*Ak(2:N); % convert to one side spectrum
Pk=Ak.*Ak; % compute power spectrum
f=[0:1:N/2]*Fs/N; % map the frequency bin to Hz
subplot(2,1,2); plot(f,Pk(1:N/2+1));grid
xlabel('Frequency (Hz)');ylabel('Power Spectrum');