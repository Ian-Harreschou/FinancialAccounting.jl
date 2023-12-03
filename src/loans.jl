# This file contains functions that pertain to fixed-term loans (not including credit cards)

mutable struct Loan 
	
	# custom type "Loan" that includes principal balance (less any down payments), the interest rate, frequency of componding, and loan duration
	
	principal_balance::Union{Float64,Int64}
	interest_rate::Union{Float64,Int64} # 0 <= i <= 1
	compound_frequency::String
	loan_duration::Int # years
	
end

function hello_package()
        return "Hello FinancialAccounting!"
end

function what_is_x()
    2
end

amortization_periods = Dict("yearly" => 1, 
                            "monthly" => 12) #"quarterly" => 4, "semi-annually" => 2

function amortization(x::Loan)

    # A = periodic payment amount
    # P = remaining principal on the loan (after any down payments)
    P = x.principal_balance
    
    # i = periodic percentage rate; decimal (0 <= i <= 1)
    i = x.interest_rate
    
    # n = total number of payments

    @assert 0 <= i <= 1 "Interest rate must be a decimal [0,1]"

    n = get(amortization_periods, x.compound_frequency, "NOT FOUND") * x.loan_duration

    if x.compound_frequency == "yearly"
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