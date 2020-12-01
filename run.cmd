@echo Notepad++ exe version silent install
REM Notepad ++ UnInstall Script
taskkill /F /IM notepad++*

if exist "%programfiles%\Notepad++\uninstall.exe" "%programfiles%\Notepad++\uninstall.exe" /S
if exist "%programfiles(x86)%\Notepad++\uninstall.exe" "%programfiles(x86)%\Notepad++\uninstall.exe" /S

REM Remove old Updater Folder (Created during last install)
if exist "%programfiles%\Notepad++\updaterdisable" rmdir "C:\Program Files\Notepad++\updaterdisable" /S /Q
if exist "%programfiles(x86)%%\Notepad++\updaterdisable" rmdir "C:\Program Files (x86)\Notepad++\updaterdisable" /S /Q

REM finding is there x86 or x64
if defined PROCESSOR_ARCHITEW6432 (goto X64)
if %PROCESSOR_ARCHITECTURE%==IA64 (goto X64)
if %PROCESSOR_ARCHITECTURE%==AMD64 (goto X64)
if %PROCESSOR_ARCHITECTURE%==x86 (goto X86)
goto X86

:X86
start /wait npp.7.9.1.Installer.exe /S
goto assoc
)

:X64
start /wait npp.7.9.1.Installer.x64.exe /S
goto assoc
)

:assoc
REM Move the Update Tools to another folder rendering them useless
@echo disable auto update
if exist "%programfiles%\Notepad++\updater" move "C:\Program Files\Notepad++\updater" "C:\Program Files\Notepad++\updaterdisable"
if exist "%programfiles(x86)%\Notepad++\updater" move "C:\Program Files\Notepad++\updater" "C:\Program Files\Notepad++\updaterdisable"
Exit