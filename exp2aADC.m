clc;
clear;
close all;

%% FM MODULATION

% Message Signal Parameters
Am = 1;
fm = 5;

% Carrier Signal Parameters
Ac = 1;
fc = 50;

% Modulation Index
beta = 5;

% Sampling Frequency
fs = 1000;

% Time Vector
t = 0:1/fs:1;

%% Message Signal
m = Am*cos(2*pi*fm*t);

%% Carrier Signal
c = Ac*cos(2*pi*fc*t);

%% FM Signal
fm_sig = Ac*cos(2*pi*fc*t + beta*sin(2*pi*fm*t));

%% FM Demodulation (Approximation)

% Differentiate the FM signal
diff_sig = [diff(fm_sig) 0];

% Rectify
rectified = abs(diff_sig);

% Moving Average Low Pass Filter
window = 20;
b = ones(1,window)/window;

demod = filter(b,1,rectified);

% Remove DC Component
demod = demod - mean(demod);

%% FFT

N = length(fm_sig);

f = (-N/2:N/2-1)*(fs/N);

FM_FFT = abs(fftshift(fft(fm_sig)))/N;

%% Plotting

figure('Name','Frequency Modulation');

subplot(4,1,1)
plot(t,m,'b','LineWidth',1.5)
title('Message Signal')
xlabel('Time (s)')
ylabel('Amplitude')
grid on

subplot(4,1,2)
plot(t,c,'r','LineWidth',1.5)
title('Carrier Signal')
xlabel('Time (s)')
ylabel('Amplitude')
grid on

subplot(4,1,3)
plot(t,fm_sig,'m','LineWidth',1.2)
title('FM Signal')
xlabel('Time (s)')
ylabel('Amplitude')
grid on

subplot(4,1,4)
plot(t,demod,'g','LineWidth',1.5)
title('Demodulated Signal')
xlabel('Time (s)')
ylabel('Amplitude')
grid on

%% Frequency Spectrum

figure('Name','FM Spectrum');

plot(f,FM_FFT,'k','LineWidth',1.5)

xlim([0 100])

grid on

title('Frequency Spectrum of FM Signal')

xlabel('Frequency (Hz)')

ylabel('Magnitude')

%% Display Results

fprintf('\n');
fprintf('******** FM MODULATION ********\n');
fprintf('Message Frequency      = %d Hz\n',fm);
fprintf('Carrier Frequency      = %d Hz\n',fc);
fprintf('Modulation Index       = %.2f\n',beta);
fprintf('Sampling Frequency     = %d Hz\n',fs);
fprintf('*******************************\n');