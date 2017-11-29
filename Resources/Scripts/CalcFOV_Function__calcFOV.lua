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
    
    -- formula NOV 2017: using vertical FOV
    _FOV = math.abs ( math.atan ( ( math.sqrt ( math.pow ( nScreenDiameter, 2 ) / ( math.pow ( nMonitorAspectRatio, 2 ) + 1 ) ) ) / ( 2 * nDistanceToScreen ) ) )
    
    this.FOV ( _FOV )
    return _FOV
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
