%--------------------------------------------------------------------------
% University of Limerick - Dept. of Electronic and Computer Engineering
%--------------------------------------------------------------------------
% filename: Lab5 - Lab5_part4.m
%
% purpose: IIR Filter
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

fc = 0.1; % cut-off frequency
Wc = 2*pi*fc % Butterworth filter cut-off
fs = 1; % Sample rate system (normalised)
fp=0.15; % prewarp frequency (set slightly higher than fc)

% generate prototype filter
[num,den] = butter(5,Wc,'s');

% frequency response of prototype filter
[h,w] = freqs(num,den);
mag = 20*log10(abs(h));
phase = angle(h);
phase = unwrap(phase);
phasedeg = phase*180/pi;
figure(1)
subplot(2,1,1), hold on, plot(w/2/pi,mag,'r'), grid on
xlabel 'Frequency (Hz)', ylabel 'Magnitude (dB)'
subplot(2,1,2), hold on, plot(w/2/pi,phasedeg,'r'), grid on
xlabel 'Frequency (Hz)', ylabel 'Phase (degrees)'

% Bilinear Transform
[numd,dend] = bilinear(num,den,fs,fp)
% plot digital filter frequency response
figure(2)
freqz(numd,dend)
% add normalized s-domain prototype filter to the same plot for comparison
w_norm = w/(2*pi*fs/2);
subplot(2,1,1), hold on, plot(w_norm,mag,'r'), grid on
subplot(2,1,2), hold on, plot(w_norm,phasedeg,'r'), grid on