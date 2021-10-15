%--------------------------------------------------------------------------
% University of Limerick - Dept. of Electronic and Computer Engineering
%--------------------------------------------------------------------------
% filename: Lab1 - part1.m
%
% purpose: Generate Gaussian signal and plot results
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
% generate 4096 noise samples
x = 5*randn([1,4096]);

% use stem(x,y)function to plot and view sample points.
figure (1);
subplot(2,1,1);
stem(x(1:50));
xlabel('Sample index \itn','Fontsize',12);
ylabel('Gaussian noise x\it(n)','Fontsize',12);
title('Gaussian noise characteristics', 'color','r','Fontsize',12);

%% part B
% use the fft() function to view a signal in the frequency domain
% Fs: sampling Frequency
% f : frequency index: convert it to Hz using k
% use the plot(x,y) command for viewing
Ak=abs(fft(x))/length(x);
Fs=8000;
k=0:1:length(x)-1;
f=k*Fs/length(x);
subplot(2,1,2); plot(f,Ak);
xlabel('Frequency (Hz)');ylabel('Signal Spectrum');

%% part C
% listen to white noise
sound(x/max(abs(x)),8000); 

