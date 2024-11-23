using QuadGK
using BenchmarkTools
using Plots
# Вычисление предела
f(n) = (1 .+ 1 ./ n) .^ n
k = 0:9
n = 10 .^ k
println("Последовательное вычисление предела:\n", f(n))

# Вычисление частичных сумм
n = 2:11
a = 1 ./ (n .* (n .+ 2))
s = [sum(a[1:i]) for i in 1:length(a)]
println("Массив из частичных сумм:\n", s)

fig1 = plot(n, a, label = "Элементы ряда", color=:red, title = "Сумма ряда")
plot!(n, s, label = "Частичные суммы", color=:blue)
savefig(fig1, "fig2.png")

# Сумма первых 1000 членов гармонического ряда
n = 1:1000
a = 1 ./ n
println("Тысячное гармоническое число = ", sum(a))

# Численное интегрирование
f(x) = exp(x^2) * cos(x)
println("Численное вычисление интеграла с помощью пакета QuadGK: ", quadgk(f, 0, pi/2))

function Midpoint(a::Float64 = 0.0, b::Float64 = pi/2, n::Int = 100, g::Function = f)::Float64
    dx = (b - a) / n
    msum = 0
    for i in 1:n
        m = a + (i - 0.5) * dx
        msum += g(m)
    end
    return msum * dx
end

function Midpoint_v(a::Float64 = 0.0, b::Float64 = pi/2, n::Int = 100, g::Function = f)::Float64
    dx = (b - a) / n
    index = 1:n
    m = a .+ (index .- 0.5)*dx
    return sum(f.(m)) * dx
end
a, b, n = 0, pi/2, 100
dx = (b - a) / n
println("Сравнение численного интегрирования циклами и векторизированными операциями:")
println("a = $a")
println("b = $b")
println("n = $n")
println("dx = $(dx)")

println("Результат при интегрировании циклами: ", Midpoint())
@btime Midpoint()

println("Результат при интегрировании векторизированными операциями: ", Midpoint_v())
@btime Midpoint_v()