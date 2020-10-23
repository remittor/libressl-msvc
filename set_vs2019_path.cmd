@echo off

set "REG_PATH=HKLM\SOFTWARE\Classes\VisualStudio.Solution.16.0\CLSID"

for /F "tokens=*" %%I in ('reg query "%REG_PATH%" /ve') do for %%A in (%%~I) do set VSS_CLSID=%%A

set "REG_PATH=HKLM\SOFTWARE\Classes\Wow6432Node\CLSID\%VSS_CLSID%\LocalServer32"

for /F "tokens=*" %%I in ('reg query "%REG_PATH%" /ve') do for %%A in (%%~I) do set VSS_PATH=%%A

set VSS_PATH=%VSS_PATH:~1,-1%
for %%i in ("%VSS_PATH%") do SET "VSS_PATH=%%~dpi"
set VSS_PATH=%VSS_PATH:~0,-1%
for %%i in ("%VSS_PATH%") do SET "VSS_PATH=%%~dpi"
:: set VSS_PATH=%VSS_PATH:~0,-1%
set "VS_TOOLS=%VSS_PATH%Tools\"
