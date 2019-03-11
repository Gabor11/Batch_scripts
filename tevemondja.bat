@ECHO OFF

COLOR a

:newStart
SETLOCAL EnableExtensions EnableDelayedExpansion

SET /A numOfThoughts=793
SET /A rand=%RANDOM% * %numOfThoughts% / 32768 + 1
SET "str=##%rand%"

rem // Define constants here:
set "_FILE=.\idezetHUN.txt"
set "_BEGIN=##%rand%"
SET /A rand+=1
set "_END=##%rand%"

CALL :findRow %_BEGIN% %_FILE% _startRow

CALL :findRow %_END% %_FILE% _endRow

CLS
ECHO  ____________________________________________________________________________________
ECHO /                                                                                    \
SET /A "lineCounter=_endRow-_startRow-1"
FOR /F "usebackq delims=" %%a IN (`more +%_startRow% %_FILE%`) DO (
  IF NOT !lineCounter!==0 (
	CALL :writeLine %%a
  ) ELSE (
    GOTO :leave
  )
)
:leave

ECHO \                                                                                    /
ECHO  ------------------------------------------------------------------------------------
ECHO         \ 
ECHO          \
ECHO             ____              
ECHO          ^<(0   0)^>       __           
ECHO            /     ^|\     /   \           
ECHO          (_'_'_)   \__ /      \  ._,^>   
ECHO               ^|                \/     
ECHO               /   _       /     ^|      
ECHO              ^|  /  ^|  / ''\    /    
ECHO              \__^|  \__\    ^|__^|          




endlocal
pause

GOTO :newStart
exit /B

:findRow
for /f "delims=:" %%A in ('findstr /n %1 %2') do (
	SET %3=%%A
	GOTO :finishedLoop
)
:finishedLoop
exit /B

:writeLine
 @ECHO off
 SET "spaces=                                                                                     "
 SET "line=^| %*%spaces%"
 SET "line=%line:~0,85% ^|"
 ECHO %line%
 SET /a lineCounter-=1
EXIT /B