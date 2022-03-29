::-===-===-===-===-===-===-===-===-===-===-===-===-===-
::
:: high low game
:: randomly generates a number
:: gives 10 guesses to guess that number
:: says whether the guess is higher or lower
:: <3
::
::-===-===-===-===-===-===-===-===-===-===-===-===-===-
@echo off
SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
setlocal enabledelayedexpansion
cls

set guesses_left=10
set /a target=(!random!%%100)+1
:: underneath, we use this method to underline to code
echo !ESC![4mA number between 1 and 100 has been generated.!ESC![0m

:main
if "%guesses_left%"=="0" goto :lose
echo !ESC![94mGuesses left: %guesses_left%!ESC![0m
set /p "guess=!ESC![93mYour guess:!ESC![0m "

if "%guess%"=="%target%" goto :win
if %guess% GTR %target% echo !ESC![33mToo high.!ESC![0m
if %guess% LSS %target% echo !ESC![33mToo low.!ESC![0m
set /a guesses_left-=1
goto :main

:lose
echo !ESC![31mYou have no guesses. The correct number was %target%.!ESC![0m
goto close

:win
echo !ESC![32mYou win. The correct number was %target%.!ESC![0m
goto close

:: underneath, we use this label to make to code cleaner
:close
echo !ESC![101m!ESC!
timeout /t -1
exit