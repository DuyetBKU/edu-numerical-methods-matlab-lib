### 💻 Explanation of each command line:
```matlab
% Khởi tạo các thông số
L = 1;
T = 1;
c = 1;
N = 10;
M = 100;
dx = L / N;
dt = T / M;

% Tạo vector x và t
x = 0:dx:L;
t = 0:dt:T;

% Khởi tạo ma trận u
u = zeros(N+1, M+1);

% Điều kiện ban đầu
u(:, 1) = sin(pi * x);
u(:, 2) = u(:, 1);

% Hệ số tính toán
alpha = (c * dt / dx)^2;

% Lặp qua các bước thời gian
for n = 2:M
   for i = 2:N
       u(i, n+1) = 2 * u(i, n) - u(i, n-1) + alpha * (u(i+1, n) - 2 * u(i, n) + u(i-1, n));
   end
   % Điều kiện biên
   u(1, n+1) = 0;
   u(N+1, n+1) = 0;
end

% Vẽ đồ thị 2D của u(x, t) tại các thời điểm khác nhau
figure;
for n = 1:M+1
    plot(x, u(:, n));
    hold on;
    xlabel('Không gian (x)');
    ylabel('u(x,t)');
    title(['Giải phương trình sóng một chiều tại thời điểm t = ', num2str((n-1)*dt)]);
    pause(0.1); % Tạo độ trễ để xem rõ hơn các bước
end
hold off;