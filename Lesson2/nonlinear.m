% Initialize data
x = 1:1000;
q = 1;

% Compute q_n and f
Qn = 1 + 1 ./ x;
f = (Qn - 1) .^ 10;

% Plot f(n) for visual inspection
figure;
plot(x, f, 'LineWidth', 1.5);
xlabel('n');
ylabel('f(n) = (q_n - 1)^{10}');
title('Values of f(n) for n = 1 to 1000');
grid on;

% Find values of n satisfying |q - q_n| <= 1e-3
tol = 1e-3;
idx = find(abs(q - Qn) <= tol);

if isempty(idx)
    disp('No values of n satisfy the condition
