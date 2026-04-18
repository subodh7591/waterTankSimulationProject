% Generate PRBS signal for Simulink (System Identification)

clear; clc;

%% Settings
Ts = 0.1;      % sampling time (must match Simulink)
N  = 2047;     % PRBS length (2^11 - 1, full sequence)

%% Generate PRBS input
u = idinput(N,'prbs',[0 0.2],[-0.2 0.8]);

%% Time vector
t = (0:N-1)' * Ts;

%% Final Simulink variable (IMPORTANT)
PRBS_signal = [t u];

%% Optional check plot
figure;
plot(t,u);
grid on;
title('PRBS Signal');
xlabel('Time (s)');
ylabel('Amplitude');

%% Confirmation
disp('PRBS_signal created successfully in workspace');