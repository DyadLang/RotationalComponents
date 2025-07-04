
### DO NOT EDIT THIS FILE
### This file is auto-generated by the Dyad command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the Dyad source code and regenerate this file

using ModelingToolkit
using ModelingToolkit: t_nounits as t
using OrdinaryDiffEqDefault
using RuntimeGeneratedFunctions
RuntimeGeneratedFunctions.init(@__MODULE__)

D = Differential(t)

import BlockComponents
@connector function __Dyad__Pin(; name)
  vars = @variables begin
    v(t), []
    i(t), [connect = Flow]
  end
  return ODESystem(Equation[], t, vars, []; name)
end
@connector function __Dyad__Node(; name)
  vars = @variables begin
    T(t), []
    Q(t), [connect = Flow]
  end
  return ODESystem(Equation[], t, vars, []; name)
end
@connector function __Dyad__Flange(; name)
  vars = @variables begin
    s(t), []
    f(t), [connect = Flow]
  end
  return ODESystem(Equation[], t, vars, []; name)
end
@connector function __Dyad__Spline(; name)
  vars = @variables begin
    phi(t), []
    tau(t), [connect = Flow]
  end
  return ODESystem(Equation[], t, vars, []; name)
end

include("AccelerationSensor_definition.jl")
include("AccelerationSource_definition.jl")
include("AngleSensor_definition.jl")
include("Damper_definition.jl")
include("Fixed_definition.jl")
include("IdealGear_definition.jl")
include("IdealGearR2T_definition.jl")
include("IdealPlanetaryGear_definition.jl")
include("IdealRollingWheel_definition.jl")
include("Inertia_definition.jl")
include("MultiSensor_definition.jl")
include("Position_definition.jl")
include("PowerSensor_definition.jl")
include("PrescribeInitialAcceleration_definition.jl")
include("PrescribeInitialEquilibrium_definition.jl")
include("PrescribeInitialPosition_definition.jl")
include("PrescribeInitialVelocity_definition.jl")
include("RackAndPinion_definition.jl")
include("RelativeAccelerationSensor_definition.jl")
include("RelativeAngleSensor_definition.jl")
include("RelativeVelocitySensor_definition.jl")
include("SpeedSource_definition.jl")
include("Spring_definition.jl")
include("SpringDamper_definition.jl")
include("TorqueSensor_definition.jl")
include("TorqueSource_definition.jl")
include("TwoInertiasWithDrivingTorque_definition.jl")
include("VelocitySensor_definition.jl")