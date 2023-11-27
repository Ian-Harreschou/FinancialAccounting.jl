using FinancialAccounting
using Test

@testset "FinancialAccounting.jl" begin
    @test FinancialAccounting.hello_package() == "Hello FinancialAccounting!"
    @test FinancialAccounting.hello_package() != "Hello World!"
end