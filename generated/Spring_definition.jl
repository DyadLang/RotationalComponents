### DO NOT EDIT THIS FILE
### This file is auto-generated by the Dyad command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the Dyad source code and regenerate this file


"""
   Spring(; name, c, phi_rel0)

Linear 1D rotational spring

## Parameters: 

| Name         | Description                         | Units  |   Default value |
| ------------ | ----------------------------------- | ------ | --------------- |
| `c`         | Spring constant                         | N.m/rad  |    |
| `phi_rel0`         | Unstretched spring angle                         | rad  |   0 |

## Connectors

 * `spline_a` - ([`Spline`](@ref))
 * `spline_b` - ([`Spline`](@ref))

## Variables

| Name         | Description                         | Units  | 
| ------------ | ----------------------------------- | ------ | 
| `phi_rel`         | Relative rotation angle between splines                         | rad  | 
| `tau`         | Torque between splines                         | N.m  | 
"""
@component function Spring(; name, c=nothing, phi_rel0=0)

  ### Symbolic Parameters
  __params = Any[]
  append!(__params, @parameters (c::Float64 = c), [description = "Spring constant"])
  append!(__params, @parameters (phi_rel0::Float64 = phi_rel0), [description = "Unstretched spring angle"])

  ### Variables
  __vars = Any[]
  append!(__vars, @variables (phi_rel(t)), [description = "Relative rotation angle between splines"])
  append!(__vars, @variables (tau(t)), [description = "Torque between splines"])

  ### Constants
  __constants = Any[]

  ### Components
  __systems = ODESystem[]
  push!(__systems, @named spline_a = __Dyad__Spline())
  push!(__systems, @named spline_b = __Dyad__Spline())

  ### Defaults
  __defaults = Dict()

  ### Initialization Equations
  __initialization_eqs = []

  ### Equations
  __eqs = Equation[]
  push!(__eqs, phi_rel ~ spline_b.phi - spline_a.phi)
  push!(__eqs, spline_b.tau ~ tau)
  push!(__eqs, spline_a.tau ~ -tau)
  push!(__eqs, tau ~ c * (phi_rel - phi_rel0))

  # Return completely constructed ODESystem
  return ODESystem(__eqs, t, __vars, __params; systems=__systems, defaults=__defaults, name, initialization_eqs=__initialization_eqs)
end
export Spring

Base.show(io::IO, a::MIME"image/svg+xml", t::typeof(Spring)) = print(io,
  """<div style="height: 100%; width: 100%; background-color: white"><div style="margin: auto; height: 500px; width: 500px; padding: 200px"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1000 1000"
    overflow="visible" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">
      <defs>
        <filter id='red-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#ff0000" flood-opacity="0.5"/></filter>
        <filter id='green-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#00ff00" flood-opacity="0.5"/></filter>
        <filter id='blue-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#0000ff" flood-opacity="0.5"/></filter>
        <filter id='drop-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="40" flood-opacity="0.5"/></filter>
      </defs>
    <g  transform="translate(-500 0) scale(0.1 0.1) rotate(0)" transform-origin="center center"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000">
  <circle cx="500" cy="500" r="500" fill="#00f"/>
</svg></g>
<g  transform="translate(500 0) scale(0.1 0.1) rotate(0)" transform-origin="center center"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000">
  <circle cx="500" cy="500" r="500" fill="#00f"/>
</svg></g>
      </svg></div></div>""")
