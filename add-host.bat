@echo off
@chcp 65001 1> nul 2> nul
rem ====================================
rem 'Hosts' 파일에 개발용 로컬 도메인을
rem  추가하는 스크립트
rem    author : exizt
rem (https://github.com/exizt/hosts-batch-script)
rem ====================================
rem 이 아래에 추가할 로컬 도메인을 셋팅합니다.
rem ====================================
call :SETHOST a.localhost
call :SETHOST b.localhost
call :SETHOST c.localhost

echo 완료되었습니다.

timeout /t 10


rem close
goto :EOF

rem ====================================
rem Function
rem ====================================
:SETHOST
set STRING=127.0.0.1 %1
set FILE=%SystemRoot%\System32\drivers\etc\hosts
TYPE %FILE% | FIND "%STRING%"> NUL
if "%ERRORLEVEL%"=="0" goto END
echo %STRING%>> %FILE%
echo %1 created.
:END
