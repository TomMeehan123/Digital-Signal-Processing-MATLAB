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

%% @fo = 600Hz

Fs=1000;
fo1=600;
N=2048;
x1 = cos(2*pi*fo1*[1:1:N]/Fs);
figure (1);

%--------------------------------------------------------------------------
% Part 1b: Calculate the FFT to translate the signal into the frequency
% domain and view the signal power spectrum from 0Hz to Fs/2.
%--------------------------------------------------------------------------

Ak=abs(fft(x1))/length(x1); % do a FFT
Ak(2:N)=2*Ak(2:N); % convert to one side spectrum
Pk=Ak.*Ak; % compute power spectrum
f=[0:1:N/2]*Fs/N; % map the frequency bin to Hz
subplot(2,1,1); plot(f,Pk(1:N/2+1));grid
xlabel('Frequency (Hz)');ylabel('Power Spectrum');

%% fo = 1000Hz
fo2=1000;
N=2048;
x1 = cos(2*pi*fo2*[1:1:N]/Fs);
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