# This file contains functions that pertain to loans

function amortization(P::Float64, i::Float64, n=12)

        A = P * (i * (1 + i) ^ n) / ((1 + i) ^ n - 1)

        return A, n
        
end