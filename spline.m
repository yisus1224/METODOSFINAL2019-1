clc
clear
Xp=27;
X=[0 8 16 24 32 40 ];
Y=[14.621 11.843 9.870 8.418 7.305 6.413];
Xa=abs(Xp-X);
p=min(find(Xa==min(Xa)));
if p==1
    A=[X(p)^2 X(p) 1;X(p+1)^2 X(p+1) 1;X(p+2)^2 X(p+2) 1];
    B=[Y(p);Y(p+1);Y(p+2)];
else
    if p~=length(X)
        A=[X(p-1)^2 X(p-1) 1;X(p)^2 X(p) 1;X(p+1)^2 X(p+1) 1];
        B=[Y(p-1);Y(p);Y(p+1)];
    else
        A=[X(p-2)^2 X(p-2) 1;X(p-1)^2 X(p-1) 1;X(p)^2 X(p) 1];
        B=[Y(p-2);Y(p-1);Y(p)];
    end
end
C=linsolve(A,B);
Yp=(C(1)*Xp^2)+(C(2)*Xp)+C(3);
plot(X,Y,'k+-',Xp,Yp,'r*')
xlabel('tºc')
ylabel('O[mg/L]')
title('concentracion de oxigeno en el agua')
legend('Medidos','Interpolado')
disp('la concentracion de oxigeno a una temperatura de 25ºc es')
disp(Yp)


