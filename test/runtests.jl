#
# Correctness Tests
#

try
    if Pkg.installed("XMLconvert") == nothing
        Pkg.clone("https://github.com/bcbi/XMLconvert.jl.git")
    end
catch
    Pkg.clone("https://github.com/bcbi/XMLconvert.jl.git")
end

if VERSION >= v"0.5.0-"
    using Base.Test
else
    using BaseTestNext
    const Test = BaseTestNext
end

using XMLconvert
using NLM
using SQLite
using DataStreams

# my_tests = ["entrez.jl",
#             "ct.jl",
#             "umls.jl"]

my_tests = ["umls.jl"]

println("Running tests:")

for my_test in my_tests
    @printf " * %s\n" my_test
    include(my_test)
end
