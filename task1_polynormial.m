syms t
q0 =1 ;
qf = 4;
t0=0;
tf = 2;
v0 =0;
vf =0;

B = solve_poly(t0,tf,q0,qf,v0,vf);

q(t) = B(1)+B(2)*t+B(3)*t^2+B(4)*t^3;
q_dot(t) = diff(q,t);
q_2dot(t) = diff(diff(q,t)); 

figure;
subplot(3,1,1);
fplot(@(t) q(t),[0,2],'r');
title('The position')
subplot(3,1,2);
fplot(@(t) q_dot(t),[0,2],'b');%[0,10]
title('The velocity')
subplot(3,1,3);
fplot(@(t) q_2dot(t),[0,2],'g');%[0,10]
title('The acceleration')



function B = solve_poly(t0,tf,q0,qf,v0,vf)
A = [1, t0, t0^2, t0^3;
     0, 1, 2*t0, 3*t0^2;
     1, tf, tf^2, tf^3;
     0, 1, 2*tf, 3*tf^2];
C = [q0, v0, qf, vf]';

%format rational 
B = A\C 
end



