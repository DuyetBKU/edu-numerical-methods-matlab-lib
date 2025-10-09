L = 1;       
T = 1;       
c = 1;       
N = 10;      
M = 100;     
dx = L / N;   
dt = T / M;   
x = 0:dx:L;  
t = 0:dt:T;   
u = zeros(N+1, M+1);  
u(:, 1) = sin(pi * x);   
u(:, 2) = u(:, 1);       
alpha = (c * dt / dx)^2;   
for n = 2:M
   for i = 2:N
       % Finite difference
       u(i, n+1) = 2 * u(i, n) - u(i, n-1) + ...
                   alpha * (u(i+1, n) - 2 * u(i, n) + u(i-1, n));
   end
   % Boundary conditions (fixed ends)
   u(1, n+1) = 0;         
   u(N+1, n+1) = 0;       
end
figure;
for n = 1:M+1
    plot(x, u(:, n));                         
    hold on;                                  
    xlabel('Space (x)');                      
    ylabel('u(x,t)');                         
    title(['1D Wave Equation at t = ', ...
          num2str((n-1)*dt)]);                
    pause(0.1);                                
end
hold off;
