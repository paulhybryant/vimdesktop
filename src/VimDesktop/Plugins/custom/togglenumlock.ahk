;~ RemoveToolTip:
;~ SetTimer, RemoveToolTip, Off
;~ ToolTip

state := GetKeyState("NumLock", "T") 
if (state)
{
	SetNumLockState off
	MsgBox С�����ѹر�
	; ToolTip, numlock off
	;~ SetTimer, RemoveToolTip, 1000
	Sleep, 1000
	Tooltip
}
else
{
	SetNumLockState on
	MsgBox С�����Ѵ�
	; tooltip, numlock on
	;~ SetTimer, RemoveToolTip, 1000
	Sleep, 1000
	Tooltip
}