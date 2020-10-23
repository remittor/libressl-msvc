@echo off

call set_libressl_path.cmd
set SLN_NAME=LibreSSL.sln
set MS_BLD_LL=m
set MS_BLD_TOOLSET=v140
set VC_STATIC_RTL=1

set PLATFORM=Win32
call "%VS140COMNTOOLS%\vsvars32.bat"
msbuild %SLN_NAME% /m /verbosity:%MS_BLD_LL% /p:PlatformToolset=%MS_BLD_TOOLSET% /t:Clean,Build /p:Platform=%PLATFORM% /p:Configuration=Debug
msbuild %SLN_NAME% /m /verbosity:%MS_BLD_LL% /p:PlatformToolset=%MS_BLD_TOOLSET% /t:Clean,Build /p:Platform=%PLATFORM% /p:Configuration=Release

set PLATFORM=x64
call "%VS140COMNTOOLS%..\..\VC\bin\x86_amd64\vcvarsx86_amd64.bat"
msbuild %SLN_NAME% /m /verbosity:%MS_BLD_LL% /p:PlatformToolset=%MS_BLD_TOOLSET% /t:Clean,Build /p:Platform=%PLATFORM% /p:Configuration=Debug
msbuild %SLN_NAME% /m /verbosity:%MS_BLD_LL% /p:PlatformToolset=%MS_BLD_TOOLSET% /t:Clean,Build /p:Platform=%PLATFORM% /p:Configuration=Release
