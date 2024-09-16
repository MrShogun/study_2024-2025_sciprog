using LinearAlgebra, Plots

# Начальные данные
D = [1 1; 2 2; 3 5; 4 4; 5 2; 6 -3]
xdata = D[:,1]
ydata = D[:,2]

# Построение точек на графике
fig = scatter(xdata, ydata, label="Исходные точки", lw=2)

# Построение матрицы A
A = [xdata.^2 xdata ones(length(xdata))]
println("Матрица системы для нахождения коэффициентов аппроксимирующего полинома:\n")
for i in 1:size(A)[1]
    for j in 1:size(A)[2]
        print(A[i, j], " ")
    end
    println("\n")
end

# Решение системы методом наименьших квадратов
b = (A'*A) \ (A'*ydata)

println("Вектор коэффициентов аппроксимирующего полинома: ", b)

# Построение аппроксимирующей параболы
x = range(0, stop=7, length=50)
y = b[1] .* x.^2 + b[2] .* x .+ b[3]
plot!(x, y, label="Аппроксимация параболой")
savefig(fig, "fig8.png")