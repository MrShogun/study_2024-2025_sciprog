using LinearAlgebra

A = [ 1 2 3 ; 0 -2 -4 ; 1 -1 0 ]
b = [4; 6; 0]

B = hcat(A, b)

println("Расширенная матрица системы уравнений:\n")
for i in 1:size(B)[1]
    for j in 1:size(B)[2]
        print(B[i, j], " ")
    end
    println("\n")
end

# Прямой ход метода Гаусса
B[3,:] = -B[1,:] + B[3,:]
B[3,:] = -1.5*B[2,:] + B[3,:]

println("Расширенная матрица системы, приведённая к верхнедиагональномму виду:\n")
for i in 1:size(B)[1]
    for j in 1:size(B)[2]
        print(B[i, j], " ")
    end
    println("\n")
end

x = A \ b
println("Решение системы уравнений: ", x)

# LU-разложение
LU = lu(A)

L = LU.L
U = LU.U
P = LU.P

println("Нижнетреугольная матрица L в LU разложении:\n")
for i in 1:size(L)[1]
    for j in 1:size(L)[2]
        print(L[i, j], " ")
    end
    println("\n")
end
println("Верхнетреугольная матрица U в LU разложении:\n")
for i in 1:size(U)[1]
    for j in 1:size(U)[2]
        print(U[i, j], " ")
    end
    println("\n")
end
println("Матрица перестановок P в LU разложении:\n")
for i in 1:size(P)[1]
    for j in 1:size(P)[2]
        print(P[i, j], " ")
    end
    println("\n")
end