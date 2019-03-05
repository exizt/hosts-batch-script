@ECHO OFF
MODE CON COLS=40 LINES=11
COLOR 3F

ECHO ======================================
ECHO Windows Local 환경의 Hosts 파일 수정
ECHO Author : e2xist
ECHO ======================================

SET FILE=%SystemRoot%\System32\drivers\etc\hosts
REM ====================================
REM 여기에 호출할 때마다 hosts 에 값을 추가합니다.
REM ====================================
CALL :SETHOST workspace.local
CALL :SETHOST mediaserver.local
CALL :SETHOST myhome.local
ECHO 설정을 완료하였습니다.

TIMEOUT /T 10


REM close
GOTO :EOF

REM ====================================
REM hosts 의 값을 추가하는 함수
REM ====================================
:SETHOST
SET STRING=127.0.0.1 %1
TYPE %FILE% | FIND "%STRING%"> NUL
IF "%ERRORLEVEL%"=="0" GOTO END
ECHO %STRING%>> %FILE%
ECHO %1 created.
:END
