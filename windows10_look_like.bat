@echo off
:: Windows 10 Look Transformation Script
:: By Epic Forge Technologies

:: Ensure Admin Privileges
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Please run this script as Administrator.
    pause
    exit /b
)

:: Change Wallpaper to Windows 10 Default
echo Changing wallpaper...
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\Windows\Web\Wallpaper\Windows\img0.jpg" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: Enable Windows 10 Start Menu (Windows 11 Only)
echo Enabling Windows 10 Start Menu...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowClassicMode /t REG_DWORD /d 1 /f

:: Set Taskbar to Small Icons and Align to Left (Windows 10 Style)
echo Adjusting Taskbar Settings...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /f

:: Set Accent Color to Windows 10 Default Blue
echo Setting Windows 10 Theme Colors...
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AccentColor /t REG_DWORD /d 0xff0078d7 /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 1 /f

:: Disable Rounded Corners (Windows 11 Only)
echo Disabling Windows 11 Rounded Corners...
reg add "HKCU\Software\Microsoft\Windows\DWM" /v ForceEffectMode /t REG_DWORD /d 2 /f

:: Restart Explorer to Apply Changes
echo Restarting Explorer...
taskkill /f /im explorer.exe
start explorer.exe

echo Windows 10 look has been applied! Restart your PC for full effect.
pause
