clc
clear
xo=0;
yo=2;
zo=4;
Dt=0.1;
xf=2;
%-----------------------------------------
X(1)=xo;
Y(1)=yo;
Z(1)=zo;
X1(1)=xo;
Y1(1)=yo;
Z1(1)=zo;
i=1;
while X(i)<=xf
    X(i+1)=X(i)+Dt;
    Y1(i+1)=Y1(i)+Dt*F1(X(i),Y1(i),Z1(i));
    Z1(i+1)=Z1(i)+Dt*F2(X(i),Y1(i),Z1(i));
    k1=Dt*F1(X(i),Y(i),Z(i));
    l1=Dt*F2(X(i),Y(1),Z(i));
    k2=Dt*F1(X(i)+0.5*Dt,Y(i)+0.5*k1,Z(i)+0.5*l1);
    l2=Dt*F2(X(i)+0.5*Dt,Y(i)+0.5*k1,Z(i)+0.5*l1);
    k3=Dt*F1(X(i)+0.5*Dt,Y(i)+0.5*k2,Z(i)+0.5*l2);
    l3=Dt*F2(X(i)+0.5*Dt,Y(i)+0.5*k2,Z(i)+0.5*l2);
    k4=Dt*F1(X(i)+Dt,Y(i)+k3,Z(i)+l3);
    l4=Dt*F2(X(i)+Dt,Y(i)+k3,Z(i)+l3);
    Y(i+1)=Y(i)+(1/6)*(k1+2*k2+2*k3+k4);
    Z(i+1)=Z(i)+(1/6)*(l1+2*l2+2*l3+l4);
    i=i+1;
end
plot(X,Y,X,Z,X,Y1,X,Z1)
legend('YRK4','ZRK4','YEuler','ZEuler')
title('RK4 vs Euler')
xlabel('X')
ylabel('Y')

%----------------------------------------
function h=F1(x,y,z)
h=-2*y+4*exp(-x);
end
function h=F2(x,y,z)
h=-(y*z^2)/3;
end
