;Hide all other windows except the active one
#h::
#SingleInstance,Force
SetWinDelay,0

If WinNotExist,ahk_id %id%
	WinRestore,A

WinGet,id,ID,A
WinGet,style,Style,ahk_id %id%
If (style & 0x20000)
{
	WinGet,winid_,List,,,Program Manager
	Loop,%winid_% 
	{
		StringTrimRight,winid,winid_%A_Index%,0
		If id=%winid%
			Continue

		WinGet,style,Style,ahk_id %winid%
		If (style & 0x20000)
		{
			WinGet,state,MinMax,ahk_id %winid%,
			If state=-1
				Continue

			WinGetClass,class,ahk_id %winid%
			If class=Shell_TrayWnd
				Continue

			IfWinExist,ahk_id %winid%
				WinMinimize,ahk_id %winid%
		}
  	}
}
return