--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : broozar
--  Description...... : FOV calculator init
--------------------------------------------------------------------------------

-- how to use

-- 1. add AI to user AI stack
-- 2. call one of the handlers:

-- example for ShiVa 2.0: local FOV = user.sendEventImmediate ( this.getUser ( ), "CalcFOV", "onCalcFOV", 21/9, 34, "in", 40, "cm" )

-- example #1 for ShiVa 1.9: user.sendEvent ( this.getUser ( ), "CalcFOV", "onCalcFOVRemote", 21/9, 34, "in", 40, "cm", "TargetAIWithFOVEventHandler", "FOVEventHandler" )
-- "TargetAIWithFOVEventHandler" will then receive the result at "FOVEventHandler"

-- example #2 for ShiVa 1.9: user.sendEvent ( this.getUser ( ), "CalcFOV", "onCalcFOV", 21/9, 34, "in", 40, "cm" ); local FOV = user.getAIVariable ( this.getUser ( ), "CalcFOV", "FOV" )

--------------------------------------------------------------------------------
function CalcFOV.onInit (  )
--------------------------------------------------------------------------------
	
	-- fill unit tables with common names and abbreviations
    
    
    local tUnit = this._tUnitInches ( )
    table.reserve ( tUnit, 3 )
    
    table.add ( tUnit, "in" )
    table.add ( tUnit, "inch" )
    table.add ( tUnit, "inches" )
    
    
    tUnit = this._tUnitFeet ( )
    table.reserve ( tUnit, 3 )
    
    table.add ( tUnit, "ft" )
    table.add ( tUnit, "foot" )
    table.add ( tUnit, "feet" )


    tUnit = this._tUnitCentimeter ( ) --> base unit
    table.reserve ( tUnit, 5 )
    
    table.add ( tUnit, "cm" )
    table.add ( tUnit, "centimeter" )
    table.add ( tUnit, "centimetre" )
    table.add ( tUnit, "centimeters" )
    table.add ( tUnit, "centimetres" )
    
    
    tUnit = this._tUnitMeter ( )
    table.reserve ( tUnit, 5 )
    
    table.add ( tUnit, "m" )
    table.add ( tUnit, "meter" )
    table.add ( tUnit, "metre" )
    table.add ( tUnit, "meters" )
    table.add ( tUnit, "metres" )
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
