; Opens a command prompt with the current folder
; when you press Win+C in Explorer

#c::
if WinActive("ahk_class CabinetWClass")
or WinActive("ahk_class ExploreWClass")
{
 ClipSaved := ClipboardAll
 Send !d
 Sleep 10
 Send ^c
 Run, cmd /K "cd /D `"%clipboard%`""
 Clipboard := ClipSaved
 ClipSaved =
 return
}
else if WinActive("ahk_class ConsoleWindowClass")
{
 Send ^c
 Sleep 10
 Send explorer .{Enter}
 Sleep 10
 return
}
return