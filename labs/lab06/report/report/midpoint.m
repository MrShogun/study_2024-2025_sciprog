a = 0
b = pi/2
n = 100
dx = (b - a) / n
function y = f(x)
    y = exp(x.^2) .* cos(x);
end
msum = 0
for i = 1:n
  m = a + (i - 0.5) * dx;
  msum = msum + f(m);
end
approx = msum * dx
