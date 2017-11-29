--------------------------------------------------------------------------------
--  Handler.......... : onCalcFOVRemote
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CalcFOV.onCalcFOVRemote ( nMonitorAspectRatio, nScreenDiameter, sUnitDiameter, nDistanceToScreen, sUnitDistance, sTargetAI, sTargetEvent )
--------------------------------------------------------------------------------
	
	local lFOV = this._calcFOV ( nMonitorAspectRatio, nScreenDiameter, sUnitDiameter, nDistanceToScreen, sUnitDistance )
    
    local hU = this.getUser ( )
    
    if sTargetAI == nil then log.warning ( "FOV: Could not send result to NIL" ) return end
    if user.hasAIModel ( hU, sTargetAI ) == false then log.warning ( "FOV: Could not send result to " ..sTargetAI ) return end
    
    user.sendEvent ( hU, sTargetAI, sTargetEvent, lFOV )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
