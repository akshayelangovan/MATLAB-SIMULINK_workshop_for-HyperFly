function [ xdot ] = myodefun( t,x,P )
%MYODEFUN Summary:
%   Contains equations of motion (Xdot = A*X + B*U) for the inverted pendulum system
%   along with a function call to a controller function that would
%   output the control input for the system (U)

y = x(1);
theta = x(2);
ydot = x(3);
thetadot = x(4);

M = P.M;
m = P.m;
l = P.l;
g = P.g;

u = controller(x,P); % function call to get system input

A = [...
    (M+m) m*l*cos(theta);
    m*l*cos(theta) m*l^2];
b = [...
    u + m*l*thetadot^2*sin(theta);
    m*g*l*sin(theta)]; 

xdot = zeros(4,1);
xdot(1) = x(3);
xdot(2) = x(4);
xdot(3:4) = A\b; % same as inv(A)*B;

end

