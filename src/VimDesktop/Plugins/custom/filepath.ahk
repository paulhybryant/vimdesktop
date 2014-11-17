;Copy selected file's path
^+c::
send ^c
sleep,200
clipboard=%clipboard%
tooltip,%clipboard%
sleep,500
tooltip,
return