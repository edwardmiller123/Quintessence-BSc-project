

    function scalarfield1
    %define tstart, tend and the number of time steps
   
    tstart = 0;
    tend = 15;
    n = 1000;
    tspan = linspace(tstart,tend,n);
    %define initial conditions 
    minit = [-0.7;0.7]
    
    % matrix m contains all dependant variables
    [t,m] = ode45(@integratingfunction, tspan, minit);
    %define output variables:
    x = m(:,1);
    
    y = m(:,2);
    
    
    
    
    % plotting functions 
    figure(1);
    
    plot(t,x);
    title('Graph of x against ln(a)');
    legend('\gamma=1 \lambda=2');
    xlabel('ln(a)');
    ylabel('x');
    hold on
    figure(2);
    
    
    
    plot(t,y);
    title('Graph of y against ln(a)');
    legend('\gamma=1 \lambda=2');
    hold on
    xlabel('ln(a)');
    ylabel('y');
    figure(3);
    
    plot(x,y);
    title('Graph of y against x');
    legend('\gamma=1 \lambda=2');
    xlabel('x');
    ylabel('y');
    axis([-1 1 0 1]);
    hold on
    
    
    figure(4);
    gammaphi=(2.*(x.^2))./((x.^2)+(y.^2));
    plot(t,gammaphi);
    title('Graph of \gamma_{\phi} against ln(a)')
    xlabel('ln(a)');
    ylabel('\gamma_{\phi}');
    legend('\gamma=1 \lambda=2');
    
    hold on
    
    omegaphi=x.^2+y.^2
    figure(5);
    plot(t,omegaphi);
    axis([0 10 0 1.2]);
     title('Graph of \Omega_{\phi} against ln(a)')
    xlabel('ln(a)');
    ylabel('\Omega_{\phi}');
    legend('\gamma=1 \lambda=2');
    hold on
    
    
    
   %INTEGRATION FUNCTION
    
   
        function ddt = integratingfunction(t,m)
            % Define constants 
            gamma=1;
            lambda=2;
            
            x=m(1);
            
            y=m(2);
            
           
            
          % system of ODE’s:
            ddt = zeros(size(m));
            ddt(1) =  -3.*x+lambda.*sqrt(3/2).*(y.^2)+(3/2).*x.*(2.*(x.^2)+gamma.*(1-(x.^2)-(y.^2)));
            ddt(2) = -lambda.*sqrt(3/2).*x.*y+(3/2).*y.*(2.*(x.^2)+gamma.*(1-(x.^2)-(y.^2)));
        
 




