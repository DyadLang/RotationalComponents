### DO NOT EDIT THIS FILE
### This file is auto-generated by the Dyad command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the Dyad source code and regenerate this file


"""
   Fixed(; name, phi0)

Shaft fixed in housing at a given angle.

## Parameters: 

| Name         | Description                         | Units  |   Default value |
| ------------ | ----------------------------------- | ------ | --------------- |
| `phi0`         | Fixed offset angle of the shaft                         | rad  |   0 |

## Connectors

 * `spline` - ([`Spline`](@ref))
"""
@component function Fixed(; name, phi0=0)

  ### Symbolic Parameters
  __params = Any[]
  append!(__params, @parameters (phi0::Float64 = phi0), [description = "Fixed offset angle of the shaft"])

  ### Variables
  __vars = Any[]

  ### Constants
  __constants = Any[]

  ### Components
  __systems = ODESystem[]
  push!(__systems, @named spline = __Dyad__Spline())

  ### Defaults
  __defaults = Dict()

  ### Initialization Equations
  __initialization_eqs = []

  ### Equations
  __eqs = Equation[]
  push!(__eqs, spline.phi ~ phi0)

  # Return completely constructed ODESystem
  return ODESystem(__eqs, t, __vars, __params; systems=__systems, defaults=__defaults, name, initialization_eqs=__initialization_eqs)
end
export Fixed

Base.show(io::IO, a::MIME"image/svg+xml", t::typeof(Fixed)) = print(io,
  """<div style="height: 100%; width: 100%; background-color: white"><div style="margin: auto; height: 500px; width: 500px; padding: 200px"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1000 1000"
    overflow="visible" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">
      <defs>
        <filter id='red-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#ff0000" flood-opacity="0.5"/></filter>
        <filter id='green-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#00ff00" flood-opacity="0.5"/></filter>
        <filter id='blue-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#0000ff" flood-opacity="0.5"/></filter>
        <filter id='drop-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="40" flood-opacity="0.5"/></filter>
      </defs>
    <g  transform="translate(0 -500) scale(0.1 0.1) rotate(0)" transform-origin="center center"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000">
  <circle cx="500" cy="500" r="500" fill="#00f"/>
</svg></g>
      </svg></div></div>""")
