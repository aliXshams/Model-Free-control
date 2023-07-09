clc;
clear;
close all;

OUT= sim('modelFree');
t = OUT.tout;
%ScopeData4 = OUT.ScopeData4;

q = OUT.outq;
qd = OUT.outqd;
v = OUT.outv;
f = OUT.outf;
qd_z1 = OUT.outqdz1;
etr = OUT.outetr;

q = squeeze(q(:,1,:));
qd = squeeze(qd(:,1,:));
v = squeeze(v(:,1,:));
f = squeeze(f(:,1,:));
etr = squeeze(etr(:,1,:));
qd_z1 = squeeze(qd_z1(:,1,:));

%plot(ScopeData4.time(1:29334),ScopeData4.signals.values(1:29334))

figure
plot(t,f)
ylabel('Disturbance(N.M)')
xlabel('t(s)')

figure;
subplot(3,1,1)
plot(t,q(1,:),t,qd(1,:));
title('q')
ylabel('q_1')
legend('q_1','q_d')
subplot(3,1,2)
plot(t,q(2,:),t,qd(2,:));
ylabel('q_2')
legend('q_2','q_d')
subplot(3,1,3)
plot(t,q(3,:),t,qd(3,:));
ylabel('q_3')
xlabel('t(s)')
legend('q_3','q_d')
figure;
plot(t,qd_z1)
legend('qd_1-z_{11}','qd_2-z_{12}','qd_3-z_{13}')
figure
plot(t,etr)
legend('e_{tr1}','e_{tr2}','e_{tr3}')
figure
plot(t,v)
ylabel('Motors Voltage (Volt)')
xlabel('t(s)')
legend('V_1','V_2','V_3')