@echo off

call set_libressl_path.cmd
call get_path_vs2019.cmd
echo VS_TOOLS="%VS_TOOLS%"

set SLN_NAME=LibreSSL.sln
set MS_BLD_LL=m
set MS_BLD_TOOLSET=v142
set VC_STATIC_RTL=0

set PLATFORM=Win32
@call "%VS_TOOLS%\VsMSBuildCmd.bat"
msbuild %SLN_NAME% /m /verbosity:%MS_BLD_LL% /p:PlatformToolset=%MS_BLD_TOOLSET% /t:Clean,Build /p:Platform=%PLATFORM% /p:Configuration=Debug
msbuild %SLN_NAME% /m /verbosity:%MS_BLD_LL% /p:PlatformToolset=%MS_BLD_TOOLSET% /t:Clean,Build /p:Platform=%PLATFORM% /p:Configuration=Release

set PLATFORM=x64
@call "%VS_TOOLS%\..\..\VC\Auxiliary\Build\vcvars64.bat"
msbuild %SLN_NAME% /m /verbosity:%MS_BLD_LL% /p:PlatformToolset=%MS_BLD_TOOLSET% /t:Clean,Build /p:Platform=%PLATFORM% /p:Configuration=Debug
msbuild %SLN_NAME% /m /verbosity:%MS_BLD_LL% /p:PlatformToolset=%MS_BLD_TOOLSET% /t:Clean,Build /p:Platform=%PLATFORM% /p:Configuration=Release
