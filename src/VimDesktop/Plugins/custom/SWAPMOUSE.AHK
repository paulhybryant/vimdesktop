^!m::

run control main.cpl
title = Mouse Properties
winwait %title%
WinActivate %title%
winwaitactive %title%

if errorlevel = 0
{
  send !s
  sleep 500
  send {enter}
}