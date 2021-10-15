%--------------------------------------------------------------------------
% University of Limerick - Dept. of Electronic and Computer Engineering
%--------------------------------------------------------------------------
% filename: Lab2 - part2.m
%
% purpose: Components of a DSP system, Analog to Digital Conversion and SQNR, 
% Aperture error specification. No. of Bits and
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

B = 15; % B is the ADC resolution in Bits
N = 1024; % size of FFT/ No. of Samples.
t = [1:1:N]; % time samples
Fs = 1e3; % sampling frequency Fs = 1000Hz
periods = 7; % no. of exact periods in sinewave
fo = (periods*Fs)/N; % i/p signal frequency - integer no. of periods
noise=randn(1,N)*0.0001; % generate random noise

% Generate a quantized B-bit sinewave with some random noise
xt=round((2^(B-1)) * sin(2*pi*fo/Fs*t))+ noise(t);
figure (1);
subplot(2,1,1);
stem(xt); grid
axis([0 N-1 -(2^B-1) (2^B-1)])
str = sprintf('%.3fHz signal sampled at Fs=%dHz', fo,Fs);
title(str,'Fontsize',12)
xlabel('Sample no.');ylabel('x\it(t)');

%--------------------------------------------------------------------------
% Part 2b: Calculate the FFT to translate the signal into the frequency
% domain and view the signal power spectrum from 0Hz to Fs/2.
% Calculate the Signal to Noise quantization value.
%--------------------------------------------------------------------------

Ak=abs(fft(xt))/N; % do a FFT
Ak(2:N)=2*Ak(2:N); % convert to one side spectrum
sAk = Ak(1:N/2);
sdb = 20 * log10(sAk); % convert the signal power in dBs
f=[0:1:N/2-1]*Fs/N; % map the frequency bin to Hz
subplot(2,1,2); plot(f,sdb);grid
axis([0 Fs/2 -50 100])
%label the x and y axis
xlabel('Frequency [Hz]');ylabel('Power Spectrum [dB]');

% calculate the SQNR - signal to quantization noise ratio from the plot.
sn = sAk;

% set dc and fundamental component = 0;
sn(1) = 1e-100;
sn(periods+1) = 1e-100;
Asignal = sAk(periods+1); % location of fundamental component
Anoise = sqrt(sum(sn.^2)); % quant. noise without the fundamental

% compute SNQR in dB.
SQNR_dB = 20*log10(Asignal/Anoise)