using Documenter, GridViewer

makedocs(;
    modules=[GridViewer],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/Arkoniak/GridViewer.jl/blob/{commit}{path}#L{line}",
    sitename="GridViewer.jl",
    authors="Andrey Oskin",
    assets=String[],
)

deploydocs(;
    repo="github.com/Arkoniak/GridViewer.jl",
)
