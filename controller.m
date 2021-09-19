function [ u ] = controller( x,P )
%CONTROLLER Summary of this function goes here
%   Detailed explanation goes here
A=[...
    0 0 1 0;...
    0 0 0 1;...
    0 -P.m*P.g/P.M 0 0;...
    0 (P.M+P.m)*P.g/(P.M*P.l) 0 0];
B=[0;0;1/P.M;-1/(P.M*P.l)];

Q=0.01*eye(4);
Q(1,1)=1;
Q(2,2)=1;
R=0.1;
K=lqr(A,B,Q,R);
u=-K*x;

end

