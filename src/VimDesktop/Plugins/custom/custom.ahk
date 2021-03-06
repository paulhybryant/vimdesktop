#Include %A_ScriptDir%\Plugins\custom\volume.ahk
; #Include %A_ScriptDir%\Plugins\custom\volumeosd.ahk
#Include %A_ScriptDir%\Plugins\custom\chrome.ahk
#Include %A_ScriptDir%\Plugins\custom\cmd.ahk
#Include %A_ScriptDir%\Plugins\custom\filepath.ahk
#Include %A_ScriptDir%\Plugins\custom\hideotherwindows.ahk
#Include %A_ScriptDir%\Plugins\custom\windowdrag.ahk
#Include %A_ScriptDir%\Plugins\custom\dock.ahk
#Include %A_ScriptDir%\Plugins\custom\fling.ahk
; #Include %A_ScriptDir%\Plugins\custom\mousecopy.ahk

; Hotkey for old IE6, map Ctrl+L to Alt+D
$^l::                      
	WinGetTitle, title, A
	if title contains Internet Explorer
	{
		; Send {Alt Down}{D Down}{D Up}{Alt Up}
		Send !d
	}
	else
	{
		Send ^l
	}
return

#IfWinActive ahk_class ConsoleWindowClass
^v::
	SendInput {Raw}%clipboard%
	return
#IfWinActive

C_W_Handler()
{
	if not (WinActive("ahk_class Chrome_WidgetWin_1") or WinActive("ahk_class Vim"))
	{
		WinClose A
	}
	else
	{
		Send ^w
	}
}
$^w::C_W_Handler()

; Swap Caps_Lock to Escape
$CapsLock::Esc
$Esc::CapsLock

; Natural scrolling
WheelUp::Send {WheelDown}
return
WheelDown::Send {WheelUp}
return

^!+Left::
	Win__Fling(-1, "A")
	return

^!+Right::
	Win__Fling(1, "A")
	return

;~ RemoveToolTip:
;~ SetTimer, RemoveToolTip, Off
;~ ToolTip
;~ return

;~ LAlt::
;~ {
	;~ KeyWait, LAlt
	;~ state := GetKeyState("NumLock", "T") 
	;~ if (state)
	;~ {
		;~ SetNumLockState off
		;~ ToolTip, numlock off
		;~ SetTimer, RemoveToolTip, 1000
	;~ }
	;~ else
	;~ {
		;~ SetNumLockState on
		;~ tooltip, numlock on
		;~ SetTimer, RemoveToolTip, 1000
	;~ }
;~ }
;~ return

; ! Alt
; # Win
; ^ Control
; + Shift