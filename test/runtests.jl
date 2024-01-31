using LaskaCore
using Test
using Unitful

include("../../paths.jl")
exp = importphy(
    PATH_TO_PHYOUTPUT,
    PATH_TO_GLXMETA,
    PATH_TO_TRIGGERCHANNEL
)
clst = getcluster(exp, 33)


@testset "Basic AbstractExperiment interface" begin
    # getcluster
    @inferred getcluster(exp, 33)

    # ntrigs
    @inferred ntrigs(exp)
    @test ntrigs(exp) == length(exp.trigtimes)

    # clusterids
    @inferred clusterids(exp)
    @test clusterids(exp) == exp.clusterids

    # triggertimes
    @inferred triggertimes(exp)
    @test triggertimes(exp) == exp.trigtimes

    # clustervector
    @inferred clustervector(exp)
    @test clustervector(exp) == exp.clusters

    # getmeta
    @test getmeta(exp) == exp.meta
    @test getmeta(exp) isa Dict{SubString{String}, SubString{String}}

    # info
    @test info(exp, 1) == exp.info[!,1]

end
