using FinancialAccounting
using Test

@testset "FinancialAccounting.jl" begin
    @test FinancialAccounting.hello_package() == "Hello FinancialAccounting!"
    @test FinancialAccounting.what_is_x() == 2
    @test FinancialAccounting.hello_package() != "Hello World!"
end