--------------------------------------------------------------------------------
--  Function......... : _conversionFactor
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CalcFOV._conversionFactor ( sUnitIdentifier )
--------------------------------------------------------------------------------
    
    -- output target
    local factor = 1
    
    -- input check
    if sUnitIdentifier == nil then log.warning ( "FOV: Unit identifier string is NIL! Assuming centimeters." ) return factor end
    if string.isEmpty ( sUnitIdentifier ) then log.warning ( "FOV: Empty unit identifier string! Assuming centimeters." ) return factor end
    
    -- get unit name tables
    local suCm  = this._tUnitCentimeter ( )
    local suM   = this._tUnitMeter ( )
    local suF   = this._tUnitFeet ( )
    local suIn  = this._tUnitInches ( )
    
    
    if      table.contains ( suCm, sUnitIdentifier ) then factor = 1
    elseif  table.contains ( suIn, sUnitIdentifier ) then factor = 2.54
    elseif  table.contains ( suM,  sUnitIdentifier ) then factor = 100
    elseif  table.contains ( suF,  sUnitIdentifier ) then factor = 30.48
    
    else log.warning ( "FOV: Unknown unit identifier string! Assuming centimeters." )
    end
    
    
    return factor
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
