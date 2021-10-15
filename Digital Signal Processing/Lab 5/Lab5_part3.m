%--------------------------------------------------------------------------
% University of Limerick - Dept. of Electronic and Computer Engineering
%--------------------------------------------------------------------------
% filename: Lab5 - Lab5_part3.m
%
% purpose: FIR Filter
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

% generate filter with fir1 command: b = fir1(n,Wn,ftype)
n=48; % Filter order
Wn = 0.25; % Filter cut-off (is always between 0 and 1)
b = fir1(n,Wn,'low');

% pole-zero Map
figure(1)
pzmap(b,1);
%zplane(b,1);
% frequency Response
freqz(b,1);

% load chirp signal (loads signal as y)
load chirp.mat

% filter signal
filt_out = filter(b,1,y);
figure(2)
plot(y);
hold on;
plot(filt_out);
xlabel('Sample No');
ylabel('Amplitude');
