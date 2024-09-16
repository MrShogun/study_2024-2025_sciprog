using LinearAlgebra, Plots

# Начальные данные
D = [ 1 1 3 3 2 1 3 ; 2 0 0 2 3 2 2 ]'
x = D[:,1]
y = D[:,2]
fig1 = plot(x, y, label="Исходный граф")

# Повороты на 90 и 225 градусов
"""Матрица поворота против часовой стрелки на некоторый угол"""
function Rotation_Matrix(theta)
    return [cos(theta) -sin(theta); sin(theta) cos(theta)]
end
theta1 = 90 * pi / 180
R1 = Rotation_Matrix(theta1)
RD1 = R1 * D'

x1 = RD1[1,:]
y1 = RD1[2,:]
plot!(x1, y1, label="Повёрнутый на 90° граф")

theta2 = 225 * pi / 180
R2 = Rotation_Matrix(theta2)
RD2 = R2 * D'

x2 = RD2[1,:]
y2 = RD2[2,:]
plot!(x2, y2, label="Повёрнутый на 225° граф")
savefig(fig1, "fig9.png")


# Отражение относительно прямой y = x
fig2 = plot(x, y, label="Исходный граф")

R = [0 1; 1 0]
RD = R * D'
plot!(RD[1,:], RD[2,:], label="Отражённый граф")
savefig(fig2, "fig10.png")

# Дилатация (растяжение) с коэффициентом 2
fig3 = plot(x, y, label="Исходный граф")

T = [2 0; 0 2]
TD = T * D'
plot!(TD[1,:], TD[2,:], label="Растяжённый граф")
savefig(fig3, "fig11.png")
