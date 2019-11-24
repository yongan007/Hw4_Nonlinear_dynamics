clear;clc;
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

vc1 = 0.75;
tc1 = (q0-qm+vc1*tm)/vc1;% 0.667;
ac1 = vc1/tc1;

vc2=-0.75;
tc2 = (qm-qf+vc2*tf)/vc2
ac2 = vc2/tc2;

q1(t) = equation1(q0,ac1,tc1,qm,tm)
q2(t) = equation2(q0,ac1,tc1,qm,tm)
q3(t) = equation3(q0,ac1,tc1,qm,tm)

q4(t) = equation1(qm,ac2,tc2,qf,tf)
q5(t) = equation2(qm,ac2,tc2,qf,tf)
q6(t) = equation3(qm,ac2,tc2,qf,tf)

q1_dot(t) = diff(q1,t);
q1_2dot(t) = diff(diff(q1,t)); 

q2_dot(t) = diff(q2,t);
q2_2dot(t) = diff(diff(q2,t)); 

q3_dot(t) = diff(q3,t);
q3_2dot(t) = diff(diff(q3,t)); 

q4_dot(t) = diff(q4,t);
q4_2dot(t) = diff(diff(q4,t)); 

q5_dot(t) = diff(q5,t);
q5_2dot(t) = diff(diff(q5,t)); 

q6_dot(t) = diff(q6,t);
q6_2dot(t) = diff(diff(q6,t)); 


figure 

subplot(3,2,1);
title('The position')
hold on 
t=linspace(t0,tc1);
plot(t,q1(t))
t=linspace(tc1,tm-tc1);
plot(t,q2(t))
t=linspace(tm-tc1,tm);
plot(t,q3(t))

hold off

subplot(3,2,2);
title('The position')
hold on 
t=linspace(0,tc2);
plot(t,q4(t))
t=linspace(tc2,tf-tc2);
plot(t,q5(t))
t=linspace(tf-tc2,tf);
plot(t,q6(t))

hold off


subplot(3,2,3);
hold on 
t=linspace(t0,tc1);
plot(t,q1_dot(t))
t=linspace(tc1,tm-tc1);
plot(t,q2_dot(t))
t=linspace(tm-tc1,tm);
plot(t,q3_dot(t))

hold off

subplot(3,2,4);
title('The velocity')
hold on 
t=linspace(0,tc2);
plot(t,q4_dot(t))
t=linspace(tc2,tf-tc2);
plot(t,q5_dot(t))
t=linspace(tf-tc2,tf);
plot(t,q6_dot(t))

hold off
%acceleration
subplot(3,2,5);
hold on 
t=linspace(t0,tc1);
plot(t,q1_2dot(t))
t=linspace(tc1,tm-tc1);
plot(t,q2_2dot(t))
t=linspace(tm-tc1,tm);
plot(t,q3_2dot(t))

hold off

subplot(3,2,6);
title('The acceleration')
hold on 
t=linspace(0,tc2);
plot(t,q4_2dot(t))
t=linspace(tc2,tf-tc2);
plot(t,q5_2dot(t))
t=linspace(tf-tc2,tf);
plot(t,q6_2dot(t))
hold off

function f1 = equation1(qi,ac,tc,qf,tf)
syms t
f1=qi +0.5*ac*t^2;
end
function f2 = equation2(qi,ac,tc,qf,tf)
syms t
f2=qi +ac*tc*(t-tc/2);
end
function f3 = equation3(qi,ac,tc,qf,tf)
syms t
f3=qf -0.5*ac*(tf-t)^2;
end


