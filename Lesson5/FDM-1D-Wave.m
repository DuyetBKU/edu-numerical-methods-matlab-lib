% Initialize parameters
L = 1;        % Length of the spatial domain (x ∈ [0, L])
T = 1;        % Total simulation time
c = 1;        % Wave propagation speed
N = 10;       % Number of spatial steps (subdivisions in space)
M = 100;      % Number of time steps (subdivisions in time)
dx = L / N;   % Spatial step size (distance between grid points)
dt = T / M;   % Time step size (time increment)

% Create spatial and temporal vectors
x = 0:dx:L;   % Spatial grid points from 0 to L
t = 0:dt:T;   % Time grid points from 0 to T

% Initialize solution matrix u
u = zeros(N+1, M+1);  % u(i, n) stores displacement at position i and time n

% Initial conditions
u(:, 1) = sin(pi * x);   % Initial displacement: sine wave at t = 0
u(:, 2) = u(:, 1);       % Initial velocity = 0 → same displacement for t = dt

% Coefficient for numerical scheme
alpha = (c * dt / dx)^2;   % Courant number squared, determines stability

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
    plot(x, u(:, n));                          % Plot wave displacement at time step n
    hold on;                                   % Keep previous plots for comparison
    xlabel('Space (x)');                       % x-axis label
    ylabel('u(x,t)');                          % y-axis label
    title(['1D Wave Equation at t = ', ...
          num2str((n-1)*dt)]);                 % Title showing current time
    pause(0.1);                                % Small pause for animation effect
end
hold off;