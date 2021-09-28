clc
clear
close all

param % runs param file so that we have all variables in workspace

options=odeset('abstol',1e-3,'reltol',1e-6); % Setting ode options
[t,z]=ode45(@myodefun,P.tspan,P.x0,options,P); % Running ode45 to solve/simulate the system

% Defining all the states from the solution matrix z
x = z(:,1);
theta = z(:,2);
xdot = z(:,3);
thetadot = z(:,4);

figure() % opens figure window
axis([-2 2 -1 2]) % sets axes or figure width and height
for i = 1:length(x)
    axis([-2 2 -1 2])
    h1 = plot([x(i)-0.2,x(i)+0.2],[0,0],'b-','LineWidth',3); % plots base or cart
    hold on % keeps the figure open and prevents erasing and overwriting
    h2 = plot([x(i),x(i) + P.l*sin(theta(i))],[0,P.l*cos(theta(i))],'k-','LineWidth',2); % plots pendulum
    hold on
    pause(1/P.framespersec) % pauses for a short time (for animation effect)
    hold on
    if (i~=(length(x)-1)) % clears the frame before drawing next frame
        delete(h1)
        delete(h2)
    end
end

figure() % opens second figure window
plot(t,x,t,theta) % plotting two curves in the same figure
legend('Cart Position', 'Angle') % adds legends to figure
xlabel('Time (s)') % adds a label for x-axis in the figure