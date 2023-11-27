using FinancialAccounting
using Test

@testset "FinancialAccounting.jl" begin
    @test FinancialAccounting.jl.hello_package() == "Hello FinancialAccounting!"
    @test FinancialAccounting.jl.hello_package() != "Hello World!"
end
