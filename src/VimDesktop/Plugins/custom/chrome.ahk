;Hotkey change for google chrome, use Alt+Num instead of Ctrl+Num
Chrome(key)
{
    if WinActive("ahk_class Vim")
    {
        Send {Alt Down}%key%{Alt Up}
    }
    else
    {
        Send {Ctrl Down}%key%{Ctrl Up}
    }
}

; The $ sign makes sure the key is pass through to the application,
; otherwise it will be an infinite loop
$!1::Chrome(1)
$!2::Chrome(2)
$!3::Chrome(3)
$!4::Chrome(4)
$!5::Chrome(5)
$!6::Chrome(6)
$!7::Chrome(7)
$!8::Chrome(8)
$!9::Chrome(9)