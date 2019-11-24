clear;clc;
syms t

f1(t)=1+2*t.^2;
f2(t)=0.5+2*t;
f3(t)=4-2*(2-t)^2;

v(t)=4*t;
v2(t)=8-4*t;

figure 
subplot(3,1,1);
hold on 
title('The position')
t=linspace(0,0.5);
plot(t,f1(t),'LineWidth',2)
t=linspace(0.5,1.5);
plot(t,f2(t),'LineWidth',2)
t=linspace(1.5,2);
plot(t,f3(t),'LineWidth',2)
grid
hold off

subplot(3,1,2);
hold on 
title('The velocity')
t=linspace(0,0.5);
plot(t,v(t),'LineWidth',2)
t=linspace(0.5,1.5);
plot(t,2*ones(size(t)),'LineWidth',2)
t=linspace(1.5,2);
plot(t,v2(t),'LineWidth',2)
grid
hold off

subplot(3,1,3);
hold on 
title('The acceleration')
t=linspace(0,0.5);
plot(t,4*ones(size(t)),'LineWidth',2)
t=linspace(0.5,1.5);
plot(t,0*ones(size(t)),'LineWidth',2)
t=linspace(1.5,2);
plot(t,-4*ones(size(t)),'LineWidth',2)
grid
hold off



