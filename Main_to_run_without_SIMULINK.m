clc
clear
close all

param
options=odeset('abstol',1e-3,'reltol',1e-6);
[t,z]=ode45(@myodefun,P.tspan,P.x0,options,P);

x = z(:,1);
theta = z(:,2);
xdot = z(:,3);
thetadot = z(:,4);

figure()
axis([-2 2 -1 2])
for i = 1:length(x)
    axis([-2 2 -1 2])
    h1 = plot([x(i)-0.2,x(i)+0.2],[0,0],'b-','LineWidth',3);
    hold on
    h2 = plot([x(i),x(i) + P.l*sin(theta(i))],[0,P.l*cos(theta(i))],'k-','LineWidth',2);
    hold on
    pause(1/30)
    hold on
    if (i~=(length(x)-1))
        delete(h1)
        delete(h2)
    end
end

figure()
plot(t,x,t,theta)
legend('Cart Position', 'Angle')