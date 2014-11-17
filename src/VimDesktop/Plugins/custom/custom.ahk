#Include %A_ScriptDir%\Plugins\custom\volume.ahk
; #Include %A_ScriptDir%\Plugins\custom\volumeosd.ahk
#Include %A_ScriptDir%\Plugins\custom\chrome.ahk
#Include %A_ScriptDir%\Plugins\custom\cmd.ahk
#Include %A_ScriptDir%\Plugins\custom\filepath.ahk
#Include %A_ScriptDir%\Plugins\custom\hideotherwindows.ahk
#Include %A_ScriptDir%\Plugins\custom\windowdrag.ahk

; Hotkey for old IE6, map Ctrl+L to Alt+D
$^L::                      
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
^V::
	SendInput {Raw}%clipboard%
	return
#IfWinActive

C_W_Handler()
{
	if not (WinActive("ahk_class Chrome_WidgetWin_1") or WinActive("ahk_class Vim"))
	{
		WinClose A
	}
	
}
^W::C_W_Handler()

; ! Alt
; # Win
; ^ Control
; + Shift