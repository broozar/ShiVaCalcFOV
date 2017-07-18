# ShiVaCalcFOV
Horizontal Field of View (FOV) calculator

Takes the screen diameter and the user's distance to the screen and calculates the optimal FOV. If you use this AI, make sure you not only change the camera FOV, but also set the camera back by the appropriate amount!

# Prototype
The handlers take these arguments:

- nMonitorAspectRatio: 21/9, 4/3, 5/4, etc.
- nScreenDiameter: diameter measurement number
- sUnitDiameter: unit string, feet, centimeter, inches, meters... see unit string tables for accepted input
- nDistanceToScreen: distance user eye to screen
- sUnitDistance: unit string, feet, centimeter, inches, meters... see unit string tables for accepted input

# How to use
1. add CalcFOV AI to user AI stack
2. call one of the handlers:

```lua
-- example for ShiVa 2.0: 
local FOV = user.sendEventImmediate ( this.getUser ( ), "CalcFOV", "onCalcFOV", 21/9, 34, "in", 40, "cm" )
```

```lua
-- example #1 for ShiVa 1.9: 
user.sendEvent ( this.getUser ( ), "CalcFOV", "onCalcFOVRemote", 21/9, 34, "in", 40, "cm", "TargetAIWithFOVEventHandler", "FOVEventHandler" )
```
"TargetAIWithFOVEventHandler" will then receive the result at "FOVEventHandler"

```lua
-- example #2 for ShiVa 1.9: 
user.sendEvent ( this.getUser ( ), "CalcFOV", "onCalcFOV", 21/9, 34, "in", 40, "cm" )
local FOV = user.getAIVariable ( this.getUser ( ), "CalcFOV", "FOV" )
```