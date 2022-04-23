
function scalarfield3
%define tstart, tend and the number of time steps
clear all

tstart = 0;
tend = 10;
n = 200;
tspan = linspace(tstart,tend,n);
%define initial conditions
minit2 = [-0.9;0.1;0.1;0.1];

% matrix m contains all dependant variables
[T,M] = ode45(@integratingfunction2, tspan, minit2);
%define output variables:
x = M(:,1);

y1 = M(:,2);

y2 = M(:,3);

z = M(:,4);



% plotting functions
figure(1);
plot(T,y1);
title('Graph of y1 against ln(a)');
legend('\lambda=1 , \sigma=1');
xlabel('ln(a)');
ylabel('y1');
axis([0 10 0 1]);
hold on
%axis tight

F=(3.*(y1.^2))+(3.*(y2.^2))-3.*(x.^2)-(z.^2)-1;

%plot(t,F,'R--');

figure(2);
plot(T,y2);
title('Graph of y2 against ln(a)');
legend('\lambda=1 , \sigma=1');
xlabel('ln(a)');
ylabel('y2');
%axis([0 10 0 1]);
%axis tight
hold on

%plot(t,F,'R--');


figure(3);
plot(T,z);
title('Graph of z against ln(a)');
legend('\lambda=1 \sigma=1');
xlabel('ln(a)');
ylabel('z');
%axis([0 10 0 1]);
axis tight
hold on



%plot(t,F,'R--');


figure(4);
plot(T,x);
title('Graph of x against ln(a)');
legend('\lambda=1 , \sigma=1');
xlabel('ln(a)');
ylabel('x');
axis([0 10 0 1]);
%axis tight

hold on


%point=1./sqrt(6);
%pointarray=point.*x0;
%plot(t,pointarray,'G--');



%plot(t,F,'R--');

%figure(5);
%plot3(x,y1,y2,'-');
%xlabel('x');
%ylabel('y1');
%zlabel('y2');
%axis([-1 1 0 1 0 1]);
%legend('hide');

%hold on

%Boundary identifying accelerating regime

%[Y1,Y2]=meshgrid(y01,y02);
%Z=meshgrid(z0);
%X=sqrt((1./3).*(3.*(Y1.^2)+(3.*(Y2.^2))-(Z.^2)-1));
%plot3(X,Y1,Y2,'G-');

figure(6);
 omega_phi=(x.^2)+(y1.^2)+(y2.^2);
   
   plot(T,omega_phi);
   xlabel('ln(a)');
   ylabel('\Omega_{\phi}');
   %axis([0 10 0 1.4 ]);
   legend('\lambda=1.444 , \sigma=4');
   axis tight
   hold on
   plot(T,F,'R--');
   
%figure(7);


%acceleration condition (2d)







%INTEGRATION FUNCTION


function ddt2 = integratingfunction2(T,M)

% Define constants

lambda=1.444;

sigma=4;

x=M(1);

y1=M(2);

y2=M(3);

z=M(4);



% system of ODE’s:
ddt2 = zeros(size(M));
ddt2(1) = (-3.*x) + (lambda.*sqrt(3./2).*(y1.^2))+(sigma.*sqrt(3./2).*(y2.^2))+x.*(2.*(z.^2)+3.*(x.^2)+(3./2).*(1-(x.^2)-(y1.^2)-(y2.^2)-(z.^2)));
ddt2(2) = (-lambda.*sqrt(3./2).*x.*y1)+y1.*(2.*(z.^2)+3.*(x.^2)+(3./2).*(1-(x.^2)-(y1.^2)-(y2.^2)-(z.^2)));
ddt2(3) = (-sigma.*sqrt(3./2).*x.*y2)+y2.*(2.*(z.^2)+3.*(x.^2)+(3./2).*(1-(x.^2)-(y1.^2)-(y2.^2)-(z.^2)));
ddt2(4) =-2.*z+2.*(z.^3)+z.*(3.*(x.^2)+(3./2).*(1-(x.^2)-(y1.^2)-(y2.^2)-(z.^2)));






