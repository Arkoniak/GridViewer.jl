using Mux
using Mustache
using JSON

abstract type AbstractGrid end
update(grid::AbstractGrid) = nothing

mutable struct D3Grid{T <: AbstractGrid}
    h::Int
    w::Int
    f::T
end

process_main(gr::D3Grid) = render(
    read(joinpath(@__DIR__, "../templates/grid.html"), String),
    Dict("width" => gr.w, "height" => gr.h, "c_width" => 1000 ÷ gr.w, "c_height" => 1000 ÷ gr.h))

function run(gr::D3Grid)
    @app d3 = (
        Mux.defaults,
        page("/", req -> Dict(
            :body => process_main(gr))),
        page("/data", req -> Dict(
                :headers => ["Content-Type" => "application/json"],
                :body => JSON.json(update(gr.f))
            )),
        Mux.notfound()
    )

    serve(d3)
end
