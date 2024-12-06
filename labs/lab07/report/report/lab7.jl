using Plots
using ImplicitPlots
using LaTeXStrings
using SpecialFunctions

# Построение циклоиды
t = range(0, stop=6*pi, length=100)
r = 2
x = @. r * (t - sin(t))
y = @. r * (1 - cos(t))

fig1 = plot(x, y, aspect_ratio=:equal, legend=false, 
        title="Циклоида", xlabel="x", ylabel="y")
savefig(fig1, "fig1.png")

# Построение улитки Паскаля в полярных координатах
theta = range(0, stop=2*pi, length=100)
r = @. 1 - 2 * sin(theta)

fig2 = plot(theta, r, proj=:polar,
title=L"Улитка Паскаля $r = 1 - 2 \sin(\theta)$")
savefig(fig2, "fig2.png")

# Построение неявно заданных функций
f(x, y) = -x^2 - x*y + x + y^2 - y - 1
fig3 = implicit_plot(f, title=L"$f(x, y) = -x^2 - x*y + x + y^2 - y - 1$")
savefig(fig3, "fig3.png")

# Построение окружности и касательной
f(x, y) = (x-2)^2 + y^2 - 25
fig4 = implicit_plot(f, title="Неявная функция: окружность", 
    xlims = (-6, 10), ylims = (-8, 8), legend=false)
x = range(-6,10,100)
y = @. 3/4*x + 19/4
plot!(x, y, color=:red, ls=:dot)
savefig(fig4, "fig4.png")

# Операции с комплексными числами
z1 = 1 + 2im
z2 = 2 - 3im

sum = z1 + z2
difference = z1 - z2
product = z1 * z2
quotient = z1 / z2

println("Сумма: $sum")
println("Разность: $difference")
println("Произведение: $product")
println("Частное: $quotient")

# Специальные функции
n = 0:1:5
x = range(-5.001,5,500)
y = @. gamma(x+1)
fig5 = scatter(n,factorial.(n), label="n!", color=:blue,
        xlims = (-5, 6), ylims = (-10, 25))
plot!(x, y, label=L"$\Gamma (n+1)$")
savefig(fig5, "fig5.png")

x1 = range(-5.001,-4.001,500)
x2 = range(-3.999,-3.001,500)
x3 = range(-2.999,-2.001,500)
x4 = range(-1.999,-1.001,500)
x5 = range(-0.999,5.001,500)
fig6 = plot(x1, gamma.(x1.+1), label=L"$\Gamma (x+1), x \in \left[-5,-4\right]$",
    xlims = (-5, 6), ylims = (-10, 25))
plot!(x2, gamma.(x2.+1), label=L"$\Gamma (x+1), x \in \left[-4,-3\right]$")
plot!(x3, gamma.(x3.+1), label=L"$\Gamma (x+1), x \in \left[-3,-2\right]$")
plot!(x4, gamma.(x4.+1), label=L"$\Gamma (x+1), x \in \left[-2,-1\right]$")
plot!(x5, gamma.(x5.+1), label=L"$\Gamma (n+1)$")
scatter!(n, factorial.(n), label="n!")
savefig(fig6, "fig6.png")