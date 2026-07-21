clc; 
clear; 
close all; 
% Parameters 
Am = 1;       
fm = 100;     
Ac = 5;       
fc = 1000;    
fs = 20*fc;   
kp = pi/2;    
% Message Amplitude (V) 
% Message Frequency (Hz) 
% Carrier Amplitude (V) 
% Carrier Frequency (Hz) 
% Sampling Frequency (Hz) 
% Phase Sensitivity (rad/V) 
% Time Vector 
t = 0:1/fs:4/fm; 
% Message Signal 
m = Am*sin(2*pi*fm*t); 
% Carrier Signal 
c = Ac*cos(2*pi*fc*t); 
% Phase Modulated Signal 
pm = Ac*cos(2*pi*fc*t + kp*m); 
% Phase Deviation 
phase_dev = kp*Am; 
% PM Modulation Index 
mp = phase_dev; 
% Display Results 
fprintf('Message Amplitude = %.2f V\n',Am); 
fprintf('Message Frequency = %.0f Hz\n',fm); 
fprintf('Carrier Amplitude = %.2f V\n',Ac); 
fprintf('Carrier Frequency = %.0f Hz\n',fc); 
fprintf('Phase Sensitivity = %.2f rad/V\n',kp); 
fprintf('Phase Deviation = %.2f radians\n',phase_dev); 
fprintf('PM Modulation Index = %.2f\n',mp); 
% Plotting 
figure('Name','Phase Modulation and Phase Deviation',... 
    'NumberTitle','off'); 
subplot(2,2,1); 
plot(t,m,'LineWidth',1.5); 
title('Message Signal'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
grid on; 
subplot(2,2,2); 
plot(t,c,'LineWidth',1.5); 
title('Carrier Signal'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
grid on; 
subplot(2,2,3); 
plot(t,pm,'LineWidth',1.5); 
title('Phase Modulated Signal'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
grid on; 
subplot(2,2,4); 
bar(phase_dev); 
title('Phase Deviation'); 
ylabel('Radians'); 
set(gca,'XTickLabel',{'PM Signal'}); 
grid on;