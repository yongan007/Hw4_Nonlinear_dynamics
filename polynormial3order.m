clear; clc; clf;
syms a1 a2 a3 a4 a5 a0 b0 b1 b2 b3 b4 t c0 c1 c2 c3 c4 c5 c6

% spline
qa=1;t1=0;
qb=2;t2=2;
qc=0;t3=4;

q1 = a0+a1*t+a2*t^2+a3*t^3;
q2 = b0+b1*t+b2*t^2+b3*t^3;

eqn1 = subs(q1, t1)==qa;
eqn2 = subs(q1, t2)==qb;
eqn3 = subs(diff(q1), t1)==0;
eqn4 = subs(diff(q1), t2)==1;

[A,B] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4], [a0, a1, a2, a3])
X = linsolve(A,B);
q1= X(1)+X(2)*t+X(3)*t^2+X(4)*t^3


eqn5 = subs(q2, t2)==qb;
eqn6 = subs(q2, t3) ==qc;
eqn7 = subs(diff(q2), t2)==1;
eqn8 = subs(diff(q2), t3)==0;

[C,D] = equationsToMatrix([eqn5, eqn6, eqn7, eqn8], [b0, b1, b2, b3])

Y = linsolve(C,D);
q2= Y(1)+Y(2)*t+Y(3)*t^2+Y(4)*t^3

figure(1)
subplot(3,1,1)
title('The position');
hold on
fplot(q1, [t1 t2])
fplot(q2, [t2 t3])
grid on
hold off
subplot(3,1,2)
title('The velocity');
hold on
fplot(diff(q1), [t1 t2])
fplot(diff(q2), [t2 t3])
hold off
grid on
subplot(3,1,3)
title('The acceleration')
hold on
fplot(diff(diff(q1)), [t1 t2])
fplot(diff(diff(q2)), [t2 t3])
grid on
hold off
