clc; clear all; close all;

RPM2radps=(2*pi)/60;

radps2RPM=60/(2*pi);

L=0.211;                                        % Arm length (m)

Ix = 0.032276; Iy = 0.031124; Iz = 0.035229;

I = diag([Ix, Iy, Iz]);                         % kg.m^2

m = 1.362;                                      % Quad [kg] + baterry+ Lidar + GPS

g = 9.81;                                       % Gravity constant [m/s^2]

%% AeroDynamics

b = 1.312186e-05;                               % Cthrust

d = 1.218100e-07;                               % CDrag

%% Initial Condition

omegaInit = [0;0;0];

attitudeInit = [0;0;0];

velInit = [0;0;0];

posInit = [0;0;0];

F0 = m*g/4;                                      % Force of each of motor [N]
%% Initial MotorDynamics
Jm = 12*10^-6;

Ra = 0.128;

Kt = 1/(1900/60*2*pi); 

Ke = Kt;

w0 = 4818;

u0 = (w0-1075)/7525;

w0r = w0*(2*pi)/60;

b = m*g/(4*w0r^2);

MotorSpeedInit = 0;

%% Intial Controller Roll/Pitch/Yaw
Kth = w0r^2/u0*b;
etaR = 0.7;                    % eta Roll
wnR = 6;                     % omega n Roll
disp("roll:")
Kp1R = Ix*etaR*wnR/(Kth*L)
Kp2R = Ix*wnR^2/(2*Kth*L*Kp1R)

etaP = etaR;                    % eta Pitch
wnP = wnR;                        % omega n Pitch
disp("pitch:")
Kp1P = Iy*etaP*wnP/(Kth*L)
Kp2P = Iy*wnP^2/(2*Kth*L*Kp1P)

Kd = d*w0r^2/u0;
etaY = 0.7;                    % eta Yaw
wnY = 4;                        % omega n Yaw
disp("yaw:")
Kp1Y = Iz*etaY*wnY/(2*Kd)
Kp2Y = Iz*wnY^2/(4*Kd*Kp1Y)

%% Control Z,X,Y 
etaz = 6.0;                    % eta z
wnz = 4;                        % omega n z
disp("z:")
Kp1z = m*etaz*wnz/(2*Kth)
Kp2z = m*wnz^2/(4*Kth*Kp1z)
% Kp1z = 1;
% Kp2z = 1;

U1 = m*g;
etax = 1;                    % eta x
wnx = 1;                        % omega n x
disp("x:")
Kp1x = 2*m*etax*wnx/U1
Kp2x = m*wnx^2/(U1*Kp1x)

etay = 1;                    % eta y
wny = 1;                        % omega n y
disp("y:")
Kp1y = 2*m*etay*wny/U1
Kp2y = m*wny^2/(U1*Kp1y)