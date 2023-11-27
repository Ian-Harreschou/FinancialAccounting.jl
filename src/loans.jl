# This file contains functions that pertain to loans

amortization_periods = Dict("yearly" => 1, 
								"semi-annually" => 2, 
							) #"quarterly" => 4, "monthly" => 12

function amortization(P::Union{Float64,Int64},
    i::Union{Float64,Int64},
    compound_frequency::String, 
    term_length::Int
    )

# A = periodic payment amount
# P = remaining principal on the loan, subtracting any down payments
# i = periodic percentage rate (0 <= i <= 1)
# n = total number of payments

n = get(amortization_periods, compound_frequency, "NOT FOUND") * term_length

if compound_frequency == "yearly"
i = i
elseif	compound_frequency == "monthly"
i = i/12
end

if i == 0
A = P / n
else
A = P * (i + i / ((1 + i) ^ n - 1))
end

return round(A, sigdigits = 4)

end