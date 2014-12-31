;~ RemoveToolTip:
;~ SetTimer, RemoveToolTip, Off
;~ ToolTip

state := GetKeyState("NumLock", "T") 
if (state)
{
	SetNumLockState off
	ToolTip, numlock off
	;~ SetTimer, RemoveToolTip, 1000
	Sleep, 1000
	Tooltip
}
else
{
	SetNumLockState on
	tooltip, numlock on
	;~ SetTimer, RemoveToolTip, 1000
	Sleep, 1000
	Tooltip
}