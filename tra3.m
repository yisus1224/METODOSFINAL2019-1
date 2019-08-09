clc
clear
L=[(7.5+(1/60)):(1/60):9.25];
n=6;
X=[7.5 7.75 8 8.25 8.75 9.25];
Y2=[18 24 26 20 18 9];
Y=[Y2./4];

for m=1:length(L);
    Xo=L(m);
for i=1:n
    Ya(i)=Y(i);
    for j=1:n
        if j~=i
            Ya(i)=Ya(i)*(Xo-X(j))/(X(i)-X(j));
        end
    end
end
Yo(m)=sum(Ya);
end


Xg=[min(X):(max(X)-min(X))/100:max(X)];
for k=1:length(Xg)
    for i=1:n
    Ya(i)=Y(i);
    for j=1:n
        if j~=i
           Ya(i)=Ya(i)*(Xg(k)-X(j))/(X(i)-X(j));
        end
   end
    end
Yg(k)=sum(Ya);
end


plot(Xg,Yg,'b-',L,Yo,'b*',X,Y,'k+')
xlabel('tiempo')
ylabel('vehiculos por min')
title('')
legend('Funcion Aproximada','Interpolado','Medidos')
disp('a).')
disp('entre las 7:30 y 9:15 pasan' )
disp(sum(Yo))
disp('vehiculos' )
disp('--------------------------------' )
disp('b).')
disp('en promedio pasan cada minuto')
disp(sum(Yo)/length(Yo))
disp('vehiculos' )

