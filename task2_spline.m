clc; clear all;

syms t

q0 =1 ;
qf = 0;
qm = 2;

t0=0;
tf = 4;
tm= 2;

v0 =0;
vf =0;
vm =-0.25;

a0 = 0;
af = 0;
am = -2.5;

B = solve_poly(t0,tm, q0, v0, a0, qm, vm, am);

B2 = solve_poly(tm,tf, qm, vm, am, qf, vf, af);

q1(t) = B(1)+B(2)*t+B(3)*t^2+B(4)*t^3+B(5)*t^4+B(6)*t^5

q2(t) = B2(1)+B2(2)*t+B2(3)*t^2+B2(4)*t^3+B2(5)*t^4+B2(6)*t^5

q1_dot(t) = diff(q1,t);
q1_2dot(t) = diff(diff(q1,t)); 

q2_dot(t) = diff(q2,t);
q2_2dot(t) = diff(diff(q2,t)); 

figure;
subplot(3,1,1);
title('The position');
hold on 
t=linspace(t0,tm);
plot(t,q1(t))
t=linspace(tm,tf);
plot(t,q2(t))
grid
hold off

subplot(3,1,2);
title('The velocity');
hold on 
t=linspace(t0,tm);
plot(t,q1_dot(t))
t=linspace(tm,tf);
plot(t,q2_dot(t))
grid
hold off

subplot(3,1,3);
title('The acceleration')
hold on 
t=linspace(t0,tm);
plot(t,q1_2dot(t))
t=linspace(tm,tf);
plot(t,q2_2dot(t))
grid
hold off


function B = solve_poly(t0, tf, q0, v0, a0, qf, vf, af)
A = [1, t0, t0^2, t0^3, t0^4, t0^5;
     0, 1, 2*t0, 3*t0^2, 4*t0^3, 5*t0^4;
     0, 0, 2, 6*t0, 12*t0^2, 20*t0^3; 
     1, tf, tf^2, tf^3, tf^4, tf^5;
     0, 1, 2*tf, 3*tf^2, 4*tf^3, 5*tf^4;
     0, 0, 2, 6*tf, 12*tf^2, 20*tf^3];
     
C = [q0, v0, a0, qf, vf, af]';

%format rational 
B = A\C ;
end



