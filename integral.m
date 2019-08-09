clear 
clc
a=2;
b=8;
p=0.001;
N=[2:p:8];

for i=1:1:((length(N))-1);
   R(i)=(N(i+1)-N(i))*((ecu(N(i))+ecu(N(i+1)))/2);
end
e=sum(R);
I=quad(@ecu,2,8);
disp('a).')
disp(e)
disp('b).')
disp(I)
Q=[2:0.001:8];
s=1;
for m=2:0.001:8;
     K(s)=ecu(m);
    s=s+1;
    
end
plot(Q,K,'-')
xlabel('t')
ylabel('f(t)')
title('grafico de la funcion e')
legend('Funcion Aproximada','Interpolado','Medidos')
function e=ecu(t)
e=45.*exp(-0.5.*t)+18.*exp(0.15.*t)+20.*((cos(0.4.*t)).^2).*exp(-0.5.*t)+(8.*((cos(0.4.*t)).^2).*exp(0.15.*t));
end