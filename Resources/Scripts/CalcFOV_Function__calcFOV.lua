--------------------------------------------------------------------------------
--  Function......... : _calcFOV
--  Author........... : broozar
--  Description...... : calculates the horizontal FOV
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CalcFOV._calcFOV ( nMonitorAspectRatio, nScreenDiameter, sUnitDiameter, nDistanceToScreen, sUnitDistance )
--------------------------------------------------------------------------------
	
    -- output target
    local _FOV = this.FOV ( )
    
    -- error control
    local e = false
    
    -- input checks
    if nMonitorAspectRatio == nil then 
        log.warning ( "FOV: Aspect Ratio is NIL, abort." )
        e = true
    elseif nMonitorAspectRatio == 0 then
        log.warning ( "FOV: Aspect Ratio is Zero, abort." )
        e = true
        
    elseif nScreenDiameter == nil then 
        log.warning ( "FOV: Screen diameter is NIL, abort." )
        e = true
    elseif nScreenDiameter == 0 then
        log.warning ( "FOV: Screen diameter is Zero, abort." )
        e = true
        
    elseif nDistanceToScreen == nil then 
        log.warning ( "FOV: Screen distance is NIL, abort." )
        e = true
    elseif nDistanceToScreen == 0 then
        log.warning ( "FOV: Screen distance is Zero, abort." )
        e = true
        
    end
    
    -- early exit on error
    if e == true then return _FOV end
    
    
    -- convert units
    nScreenDiameter = nScreenDiameter * this._conversionFactor ( sUnitDiameter )
    nDistanceToScreen = nDistanceToScreen * this._conversionFactor ( sUnitDistance )
    
    _FOV = 2 *  ( 90 -  math.abs (  math.atan ( 2*nDistanceToScreen / math.sqrt ( (nScreenDiameter*nScreenDiameter) / (1 + (1/(nMonitorAspectRatio*nMonitorAspectRatio)) ) ) )  ) )
    
    this.FOV ( _FOV )
    return _FOV
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
