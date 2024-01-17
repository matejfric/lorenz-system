# Lorenz system

The [Lorenz system](https://en.wikipedia.org/wiki/Lorenz_system) is a system of ODEs:

$$
\begin{align}
\frac{\mathrm{d}x}{\mathrm{d}t} &= \sigma (y - x), \\
\frac{\mathrm{d}y}{\mathrm{d}t} &= x (\rho - z) - y, \\
\frac{\mathrm{d}z}{\mathrm{d}t} &= x y - \beta z.
\end{align}
$$

Below is an example of the Lorenz attractor, a chaotic solution of the Lorenz system for parameters $\sigma=10, \rho=42, \beta=8/3$

![Lorenz attractor](lorenz42.gif)
