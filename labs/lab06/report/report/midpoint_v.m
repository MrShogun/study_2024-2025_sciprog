a = 0
b = pi/2
n = 100
dx = (b-a)/n
function y = f(x)
    y = exp(x.^2) .* cos(x);
end
m = [a+dx/2:dx:b-dx/2];
M = f(m);
approx = dx * sum(M)
