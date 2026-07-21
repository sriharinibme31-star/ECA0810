clc;
clear;
close all;

%% Parameters
Am = 1;          % Message amplitude
Ac = 1;          % Carrier amplitude
fm = 5;          % Message frequency (Hz)
fc = 50;         % Carrier frequency (Hz)
beta = 5;        % Modulation index
fs = 5000;       % Sampling frequency (Hz)
T = 1;           % Duration (s)

%% Time Vector
t = 0:1/fs:T;

%% Signals
m = Am*cos(2*pi*fm*t);
c = Ac*cos(2*pi*fc*t);
fm_sig = Ac*cos(2*pi*fc*t + beta*sin(2*pi*fm*t));

%% Create Figure
figure('Name','FM Modulation','NumberTitle','off','Color','w');

subplot(3,1,1);
plot(t,m,'b','LineWidth',2);
grid on;
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t,c,'r','LineWidth',1.5);
grid on;
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t,fm_sig,'k','LineWidth',1);
grid on;
title('FM Signal');
xlabel('Time (s)');
ylabel('Amplitude');

drawnow;
shg;