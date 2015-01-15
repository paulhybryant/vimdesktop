;~ RemoveToolTip:
;~ SetTimer, RemoveToolTip, Off
;~ ToolTip

state := GetKeyState("NumLock", "T") 
if (state)
{
	SetNumLockState off
	MsgBox 小键盘已关闭
	; ToolTip, numlock off
	;~ SetTimer, RemoveToolTip, 1000
	Sleep, 1000
	Tooltip
}
else
{
	SetNumLockState on
	MsgBox 小键盘已打开
	; tooltip, numlock on
	;~ SetTimer, RemoveToolTip, 1000
	Sleep, 1000
	Tooltip
}