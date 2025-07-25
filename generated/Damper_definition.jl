### DO NOT EDIT THIS FILE
### This file is auto-generated by the Dyad command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the Dyad source code and regenerate this file


"""
   Damper(; name, d)

Linear 1D rotational damper

## Parameters: 

| Name         | Description                         | Units  |   Default value |
| ------------ | ----------------------------------- | ------ | --------------- |
| `d`         | Damping constant                         | N.m.s/rad  |    |

## Connectors

 * `spline_a` - ([`Spline`](@ref))
 * `spline_b` - ([`Spline`](@ref))

## Variables

| Name         | Description                         | Units  | 
| ------------ | ----------------------------------- | ------ | 
| `phi_rel`         | Relative rotation angle between splines                         | rad  | 
| `tau`         | Torque between splines                         | N.m  | 
| `w_rel`         | Relative angular velocity between splines                         | rad/s  | 
| `a_rel`         | Relative angular acceleration between splines                         | rad/s2  | 
"""
@component function Damper(; name, d=nothing)

  ### Symbolic Parameters
  __params = Any[]
  append!(__params, @parameters (d::Float64 = d), [description = "Damping constant"])

  ### Variables
  __vars = Any[]
  append!(__vars, @variables (phi_rel(t)), [description = "Relative rotation angle between splines"])
  append!(__vars, @variables (tau(t)), [description = "Torque between splines"])
  append!(__vars, @variables (w_rel(t)), [description = "Relative angular velocity between splines"])
  append!(__vars, @variables (a_rel(t)), [description = "Relative angular acceleration between splines"])

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
  push!(__eqs, D(phi_rel) ~ w_rel)
  push!(__eqs, D(w_rel) ~ a_rel)
  push!(__eqs, tau ~ d * w_rel)

  # Return completely constructed ODESystem
  return ODESystem(__eqs, t, __vars, __params; systems=__systems, defaults=__defaults, name, initialization_eqs=__initialization_eqs)
end
export Damper

Base.show(io::IO, a::MIME"image/svg+xml", t::typeof(Damper)) = print(io,
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
