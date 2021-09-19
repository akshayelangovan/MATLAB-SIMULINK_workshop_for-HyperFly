clc
clear
close all

P.x0=[0;pi/4;0;0];% y theta ydot thetadot
P.tspan = linspace(0,5,30*5);
P.g=9.8;
P.M=1; % cart mass kg
P.m=1/P.g; % pendulum bob weight
P.l=0.5; % length of pendulum rod meters