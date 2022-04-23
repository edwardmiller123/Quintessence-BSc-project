 function scalarfield2
    %tstart, tend and the number of time steps
   
    tstart = 0;
    tend = 12;
    n = 200;
    tspan = linspace(tstart,tend,n);
    %initial conditions 
    minit = [-0.1;0.1;0.9];
    
    % matrix m contains all dependant variables
    [t,m] = ode45(@integratingfunction, tspan, minit);
    %output variables:
    x = m(:,1);
    
    y = m(:,2);
    
    z = m(:,3);
    
 
    
    
    %plots 
    figure(1);
    
    plot(t,x);
    title('Graph of x against ln(a)');
    legend('\lambda=5');
    xlabel('ln(a)');
    ylabel('x');
    hold on
    F=3.*(y.^2)-3.*(x.^2)-(z.^2)-1;
   
   plot(t,F,'R--');
    figure(2);
    
    
    
    plot(t,y);
    title('Graph of y against ln(a)');
    legend('\lambda=5');
    hold on
    xlabel('ln(a)');
    ylabel('y');
    
     plot(t,F,'R--');
     
    figure(3);
    
    plot(t,z);
     title('Graph of z against ln(a)');
    legend('\lambda=5');
    hold on
    xlabel('ln(a)');
    ylabel('z');
    
     plot(t,F,'R--');
     
   figure(4);
   
    
   plot3(x,y,z,'-');
   xlabel('x');
   ylabel('y');
   zlabel('z');
   axis([-1 1 0 1 0 1]);
   legend('hide');
   hold on
   
   %Boundary identifying accelerating regime
   x1=linspace(-1,1,100);
   y1=linspace(0,1,100);
   [X,Y]=meshgrid(x1,y1);
   z1=sqrt(3.*(Y.^2)-3.*(X.^2)-1);
   plot3(X,Y,z1,'G-');
   
   figure(5);
   omega_phi=(x.^2)+(y.^2);
   
   plot(t,omega_phi);
   xlabel('ln(a)');
   ylabel('\Omega_{\phi}');
   axis([0 12 0 1.4 ]);
   legend('\lambda=5');
    
   hold on
  
   figure(6);
   
   
   %acceleration condition
   F=3.*(y.^2)-3.*(x.^2)-(z.^2)-1;
   
   plot(t,F,'R--');
   xlabel('ln(a)');
   ylabel('\Omega_{\phi}');
   legend('Acceleration condition')
   hold on
   plot(t,omega_phi,'B-');
   
   
    
    
    
    
    
   %Intergration function
    
   
        function ddt = integratingfunction(t,m)
            %Constants 
            
            lambda=5;
            
            x=m(1);
            
            y=m(2);
            
            z=m(3);
            
           
            
          % ODE’s:
            ddt = zeros(size(m));
            ddt(1) = -3.*x + lambda.*sqrt(3./2).*(y.^2)+x.*(2.*(z.^2)+3.*(x.^2)+(3./2).*(1-(x.^2)-(y.^2)-(z.^2)));
            ddt(2) = -lambda.*sqrt(3./2).*x.*y+y.*(2.*(z.^2)+3.*(x.^2)+(3./2).*(1-(x.^2)-(y.^2)-(z.^2)));
            ddt(3) =-2.*z+2.*(z.^3)+z.*(3.*(x.^2)+(3./2).*(1-(x.^2)-(y.^2)-(z.^2)));
        
 




