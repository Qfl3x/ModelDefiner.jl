using ModelDefiner
using Documenter

DocMeta.setdocmeta!(ModelDefiner, :DocTestSetup, :(using ModelDefiner); recursive=true)

makedocs(;
    modules=[ModelDefiner],
    authors="qfl3x <qfl3x@protonmail.com> and contributors",
    repo="https://github.com/Ayoub Chettouh/ModelDefiner.jl/blob/{commit}{path}#{line}",
    sitename="ModelDefiner.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://Ayoub Chettouh.github.io/ModelDefiner.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Ayoub Chettouh/ModelDefiner.jl",
    devbranch="main",
)
