# This file contains functions that pertain to fixed-term loans (not including credit cards)

mutable struct Loan 
	
	# custom type "Loan" that includes principal balance (less any down payments), the interest rate, frequency of componding, and loan duration
	
	principal_balance::Union{Float64,Int64}
	interest_rate::Union{Float64,Int64} # 0 <= i <= 1
	compound_frequency::String
	loan_duration::Int # years
	
end

function hello_package()
        println("Hello FinancialAccounting!")
end

export hello_package

amortization_periods = Dict("yearly" => 1, 
                            "monthly" => 12) #"quarterly" => 4, "semi-annually" => 2

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
    else	
        i = i/12
    end
        
    if i == 0
        A = P / n
    else
        A = P * (i + i / ((1 + i) ^ n - 1))
    end
    
    return round(A, sigdigits = 4)
        
end