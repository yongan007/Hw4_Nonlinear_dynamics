

clc;clear;
syms t

b=0;
c=pi/2;
d=2.5;
a=1.5*c;
q_dot(t) =a*(b+sin(c*t));
q(t)=a*(b*t-cos(c*t)/c)+d;
q_2dot(t) = a*c*cos(c*t);

figure 
subplot(3,1,1);
t=linspace(0,2);
plot(t,q(t),'b')
title('The position')


subplot(3,1,2);
t=linspace(0,2);
plot(t,q_dot(t),'r')
title('The velocity')
subplot(3,1,3);
t=linspace(0,2);
plot(t,q_2dot(t),'g',)
title('The acceleration')



