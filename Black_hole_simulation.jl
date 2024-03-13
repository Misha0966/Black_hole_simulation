using Plots
using ImageMagick
# Определение функции, представляющей завихрение черной дыры
function black_hole_spiral_formula(t, i)
    r = 1 + 0.1 * t
    θ_values = LinRange(0, 2π, 100)
    x = r * cos.(θ_values)
    y = r * sin.(θ_values)
    return x, y
end

# Создание анимации спирали черной дыры с расширением
t_values = 1:100
anim = @animate for i in t_values
    x, y = black_hole_spiral_formula(i, i)
    plot(x, y, seriestype=:scatter, label="Black Hole Spiral", xlabel="X", ylabel="Y", xlims=(-2, 2), ylims=(-2, 2))
end

# Сохранение анимации в GIF-формате с использованием ImageMagick
gif(anim, "black_hole_spiral_animation.gif", fps = 15)