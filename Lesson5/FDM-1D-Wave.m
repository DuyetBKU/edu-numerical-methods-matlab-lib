% Initialize parameters
L = 1;       
T = 1;       
c = 1;       
N = 10;      
M = 100;     
dx = L / N;   
dt = T / M;   

% Create spatial and temporal vectors
x = 0:dx:L;  
t = 0:dt:T;   

% Initialize solution matrix u
u = zeros(N+1, M+1);  

% Initial conditions
u(:, 1) = sin(pi * x);   
u(:, 2) = u(:, 1);       

% Coefficient for numerical scheme
alpha = (c * dt / dx)^2;   

% Time-stepping loop
for n = 2:M
   for i = 2:N
       % Finite difference scheme for the wave equation
       u(i, n+1) = 2 * u(i, n) - u(i, n-1) + ...
                   alpha * (u(i+1, n) - 2 * u(i, n) + u(i-1, n));
   end
   % Boundary conditions (fixed ends)
   u(1, n+1) = 0;          % Left boundary (x=0) fixed
   u(N+1, n+1) = 0;        % Right boundary (x=L) fixed
end

% Plot the wave profile over time
figure;
for n = 1:M+1
    plot(x, u(:, n));                         
    hold on;                                   % Keep previous plots for comparison
    xlabel('Space (x)');                       % x-axis label
    ylabel('u(x,t)');                          % y-axis label
    title(['1D Wave Equation at t = ', ...
          num2str((n-1)*dt)]);                 % Title showing current time
    pause(0.1);                                % Small pause for animation effect
end
hold off;