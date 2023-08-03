module RollingArrays
import Base: getindex, setindex!, length, push!, append!

mutable struct RollingArray{T <: Any}
    length::Int64
    elements::Vector{T}
    RollingArray{T}(length::Int64 = 5) where {T <: Any} = begin
        elements = Vector{T}()
        new{T}(length, elements)::RollingArray{T}
    end
    RollingArray{T}(vec::Vector{<:Any}) where {T <: Any} = begin
        new{T}(length(vec), Vector{T}(vec))::RollingArray{T}
    end
    RollingArray(elements::Vector{<:Any}, length::Int64 = length(elements)) = begin
        T = typeof(elements).sig.parameters[1]
        new{T}(length, elements)
    end
end

getindex(ra::RollingArray{<:Any}, i::Int64) = ra.elements[i]
setindex!(ra::RollingArray{<:Any}, i::Int64, a::Any) = ra.elements[i] = a

length(ra::RollingArray{<:Any}) = ra.length

function push!(ra::RollingArray{<:Any}, dims::Any ...)
    [begin 
        if length(ra.elements) == ra.length
            deleteat!(ra.elements, 1)
            push!(ra.elements, dim)
        else
            push!(ra.elements, dim)
        end
    end for dim in dims]
    return
end

append!(ra::RollingArray{<:Any}, dims::Any ...) = push!(ra, dims ...)

append!(ra::RollingArray{<:Any}, dims::Vector{<:Any}) = push!(ra, dims ...)

export RollingArray
end # module RollingArrays
