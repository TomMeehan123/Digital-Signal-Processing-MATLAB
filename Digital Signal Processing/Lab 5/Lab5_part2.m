%--------------------------------------------------------------------------
% University of Limerick - Dept. of Electronic and Computer Engineering
%--------------------------------------------------------------------------
% filename: Lab5 - Lab5_part2.m
%
% purpose: Power Spectrum and Aliasing
%
% created by: Tom Meehan
% created on: 14 October 2021
%
%--------------------------------------------------------------------------
% Copyright 2021 University of Limerick
%--------------------------------------------------------------------------
clc
clear
clear all
close all
%% I
% set up variables
N = 128;
fa = 100;
Fs = 1e3;

% generate range of 0->N-1 (choose N as a power of 2 e.g. 64,128)
n_range = [0:N-1];
A = 1;
x = A*sin(2*pi*fa/Fs*n_range);
figure(1)
hold on
plot(x,'*:');
xlabel('Sample No');
ylabel('Amplitude');

%% II
% perform DFT with Matlab fft command
Y = fft(x);

% obtain power from multiplication with complex conjugate
PY = Y.*conj(Y);

% double all values except for DC for single sided spectrum
PY(2:N) = 2.*PY(2:N);

% normalise the FFT to the highest coefficient value (not including DC)
PY = PY/max(PY(2:N));

% convert to dB
PY = 10*log10(PY);

%% III
% generate frequency bins
F_vals = ([0:N-1]/N)*Fs;

% plot Power Spectrum
figure(2)
hold on

% display frequencies to Fs/2
plot(F_vals(1:N/2),PY(1:N/2))
xlabel('Frequency (Hz)')
ylabel('power (dB)')

%% IV
Wh = hann(N);
x = A*sin(2*pi*fa/Fs*n_range);
x = x.*Wh';

figure(1)
hold on
plot(x,'*:');
xlabel('Sample No');
ylabel('Amplitude');

%% II
% perform DFT with Matlab fft command
Y = fft(x);

% obtain power from multiplication with complex conjugate
PY = Y.*conj(Y);

% double all values except for DC for single sided spectrum
PY(2:N) = 2.*PY(2:N);

% normalise the FFT to the highest coefficient value (not including DC)
PY = PY/max(PY(2:N));

% convert to dB
PY = 10*log10(PY);

%% III
% generate frequency bins
F_vals = ([0:N-1]/N)*Fs;

% plot Power Spectrum
figure(2)
hold on

% display frequencies to Fs/2
plot(F_vals(1:N/2),PY(1:N/2))
xlabel('Frequency (Hz)')
ylabel('power (dB)')