^#Up::
    WinGet, window, ID, A
	idx := GetActiveMonitor(%window%)
	SysGet mon, MonitorWorkArea, %idx%
	monWidth := Abs(monLeft - monRight)
	monHeight := Abs(monBottom - monTop)
	x := monLeft
	y := monTop
	width := monWidth
	SysGet, idxPrimary, MonitorPrimary
	if (idx == idxPrimary) {
		height := monHeight - 62
	} else {
		height := monHeight
	}
    WinMove, ahk_id %window%, , %x%, %y%, %width%, %height%
    return

^#Down::
	WinGet, window, ID, A
	idx := GetActiveMonitor(%window%)
	SysGet mon, MonitorWorkArea, %idx%
	monWidth := Abs(monLeft - monRight)
	monHeight := Abs(monBottom - monTop)
	x := monLeft + monWidth / 4
	y := monTop + monHeight / 4
	width := monWidth / 2
	height := monHeight / 2
    WinMove, ahk_id %window%, , %x%, %y%, %width%, %height%
    return
	
^#Left::
    WinGet, window, ID, A
	idx := GetActiveMonitor(%window%)
	SysGet mon, MonitorWorkArea, %idx%
	monWidth := Abs(monLeft - monRight)
	monHeight := Abs(monBottom - monTop)
	x := monLeft
	y := monTop
	width := monWidth / 2
	SysGet, idxPrimary, MonitorPrimary
	if (idx == idxPrimary) {
		height := monHeight - 62
	} else {
		height := monHeight
	}
    WinMove, ahk_id %window%, , %x%, %y%, %width%, %height%
    return

^#Right::
    WinGet, window, ID, A
	idx := GetActiveMonitor(%window%)
	SysGet mon, MonitorWorkArea, %idx%
	monWidth := Abs(monLeft - monRight)
	monHeight := Abs(monBottom - monTop)
	x := monLeft + monWidth / 2
	y := monTop
	width := monWidth / 2
	SysGet, idxPrimary, MonitorPrimary
	if (idx == idxPrimary) {
		height := monHeight - 62
	} else {
		height := monHeight
	}
    WinMove, ahk_id %window%, , %x%, %y%, %width%, %height%
    return

; Senses the Monitor of the provided window (by HWND). If no window is provided, this
; function checks the Active Window. This can be useful for determining which monitor
; the user is actively interacting with.
; With minor modification, this function could also account for vertically positioned 
; monitors.

GetActiveMonitor(hwnd := 0) {
	; If no hwnd is provided, use the Active Window
	if (hwnd)
		WinGetPos, winX, winY, winW, winH, ahk_id %hwnd%
	else
		WinGetActiveStats, winTitle, winW, winH, winX, winY

	SysGet, numDisplays, MonitorCount
	SysGet, idxPrimary, MonitorPrimary
	Loop %numDisplays%
	{	SysGet, mon, MonitorWorkArea, %a_index%
		; Left may be skewed on Monitors past 1
		if (a_index > 1)
			monLeft -= 10
		; Right overlaps Left on Monitors past 1
		else if (numDisplays > 1)
			monRight -= 10
		; Tracked based on X. Cannot properly sense on Windows "between" monitors
		if (winX >= monLeft && winX < monRight)
			return %a_index%
	}
	; Return Primary Monitor if can't sense
	return idxPrimary
}