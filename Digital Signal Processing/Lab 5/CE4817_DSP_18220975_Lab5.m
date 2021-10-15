%--------------------------------------------------------------------------
% University of Limerick - Dept. of Electronic and Computer Engineering
%--------------------------------------------------------------------------
% filename: Lab5 - CE4187_DSP_18220975_Lab5.m
%
% purpose: Convolution and Discrete Fourier Transform
%
% created by: Tom Meehan
% created on: 14 October 2021
%
%--------------------------------------------------------------------------
% Copyright 2021 University of Limerick
%--------------------------------------------------------------------------

clc
clear all
close all

%--------------------------------------------------------------------------
% Part 1: Plot to output yn in time domain for N = 1024 samples
%--------------------------------------------------------------------------

% Set Variables
f1 = 10000;
f2 = 25000;
fs = 100000;
N = 1024;
n_range = [1:1:N];
A = 2048;
hn = [0.1125 0.2941 0.3750, 0.2941, 0.1125];

% Create signals x1 and x2
x1 = A*sin(2*pi*f1*([1:1:N]/fs));
x2 = A*sin(2*pi*f2*([1:1:N]/fs));

% Multiply the signals to create xn
xn = x1.*x2;

% Convlute xn and hn
yn = conv(xn,hn);

% Plot yn in the time domain
figure(1)
hold on
plot(yn,'*:')
title('Plot of yn in the time Domain')
xlabel('Number of Samples');
ylabel('Amplitude');

%--------------------------------------------------------------------------
% Part 2: Find the fft of yn and plot the single sided power spectrum
%--------------------------------------------------------------------------

% perform DFT with Matlab fft command
Yk = fft(yn);

% obtain power from multiplication with complex conjugate
PY = Yk.*conj(Yk);

% double all values except for DC for single sided spectrum
PY(2:N) = 2.*PY(2:N);

% normalise the FFT to the highest coefficient value (not including DC)
PY = PY/max(PY(2:N));

% convert to dB
PY = 10*log10(PY);

% generate frequency bins
F_vals = ([0:N-1]/N)*fs;

% plot Power Spectrum
figure(2)
hold on

% display frequencies to Fs/2
plot(F_vals(1:N/2),PY(1:N/2))
xlabel('Frequency (Hz)')
ylabel('power (dB)')

% Introduce a hann window
Wh = hann(N+4);
yn2 = yn.*Wh';

figure(1)
hold on
plot(yn2,'*:');
xlabel('Sample No');
ylabel('Amplitude');

% perform DFT with Matlab fft command
Yk2 = fft(yn2);

% obtain power from multiplication with complex conjugate
PY = Yk2.*conj(Yk2);

% double all values except for DC for single sided spectrum
PY(2:N) = 2.*PY(2:N);

% normalise the FFT to the highest coefficient value (not including DC)
PY = PY/max(PY(2:N));

% convert to dB
PY = 10*log10(PY);

% generate frequency bins
F_vals = ([0:N-1]/N)*fs;

% plot Power Spectrum
figure(2)
hold on

% display frequencies to Fs/2
plot(F_vals(1:N/2),PY(1:N/2))
xlabel('Frequency (Hz)')
ylabel('power (dB)')