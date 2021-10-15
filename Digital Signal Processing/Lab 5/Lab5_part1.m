%--------------------------------------------------------------------------
% University of Limerick - Dept. of Electronic and Computer Engineering
%--------------------------------------------------------------------------
% filename: Lab5 - Lab5_part1.m
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

%% A
% simple convolution
x = [1,2,3,1,0]
h = [0,1,2,1,-1]
y = conv(x,h)
figure(1)
plot(y)

%% B
% simple DFT
x = [1,3,2,1]
k = fft(x)
figure(2)
plot(k)