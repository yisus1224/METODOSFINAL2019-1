clc
clear
X=[0 8 16 24 32 40 ];
Y=[14.621 11.843 9.870 8.418 7.305 6.413];
Xm=27;
i=1;
while X(i)<Xm
    i=i+1;
end
Ym=Y(i)-((Y(i)-Y(i-1))/(X(i)-X(i-1)))*(X(i)-Xm);
plot(X,Y,'b-*',Xm,Ym,'r+')
xlabel('tºc')
ylabel('O[mg/L]')
title('concentracion de oxigeno en el agua')
legend('medidos','interpolado')
disp('la concentracion de oxigeno cuando la temperatura es de 25ºc')
disp(Ym)

