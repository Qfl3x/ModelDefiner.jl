# A model is composed of:
# Parameters: with their bounds and default values
# Dependent Variables
# Equations
# Boundary Conditions
# Problem Constructor/Discretizer
# Solver

using MethodOfLines, ModelingToolkit
struct Model
    variables::Any
    parameters::Any
    dep_vars::Any
    equations::Any
    bcs::Any
    domain::Any
    discretizer::Any
end

struct Problem
    prob::Any
    solver::Any
end


function (m::Model)(global_parameters, return_sys=false)
    variables = m.variables(global_parameters)
    params = m.parameters(global_parameters)
    dep_vars = m.dep_vars(global_parameters)
    equations = m.equations(global_parameters)
    bcs = m.bcs(global_parameters)
    domain = m.domain(global_parameters)
    discretizer = m.discretizer(global_parameters)

    default_params = [param => getdefault(param) for param in params]
    @named pdesys = PDESystem(equations, bcs, domain, variables, dep_vars, default_params)
    prob = discretizer(pdesys)
    if return_sys
        prob, pdesys
    else
        prob
    end
end
