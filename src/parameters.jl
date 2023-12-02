using Symbolics: _parse_vars, Num, @variables
using Symbolics

using ModelingToolkit
import SciMLBase: issymbollike

import Base: +, -, *, /

struct VariableDefault end
Symbolics.option_to_metadata_type(::Val{:default}) = VariableDefault
getdefault(x::Num) = getdefault(Symbolics.unwrap(x))

function getdefault(x)
    p = Symbolics.getparent(x, nothing)
    p === nothing || (x = p)
    Symbolics.getmetadata(x, VariableDefault, 0.)
end
