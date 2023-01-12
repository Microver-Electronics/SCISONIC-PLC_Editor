@echo off
setlocal enabledelayedexpansion
set user=%USERNAME%
set cd=%CD%
xcopy /y /i "%cd%\source\MicroBCM.cpp" "C:\Users\%user%\OpenPLC_Editor\editor\arduino\src\hal\"
xcopy /y /i "%cd%\source\MicroBCM.hal" "C:\Users\%user%\OpenPLC_Editor\editor\arduino\src\hal\"
xcopy /y /i "%cd%\source\builder.py" "C:\Users\%user%\OpenPLC_Editor\editor\arduino\"
xcopy /y /i "%cd%\source\hals.json" "C:\Users\%user%\OpenPLC_Editor\editor\arduino\examples\Baremetal\"
xcopy /y /i "%cd%\source\splash.png" "C:\Users\%user%\OpenPLC_Editor\editor\images\"
xcopy /y /i "%cd%\source\arduino.png" "C:\Users\%user%\OpenPLC_Editor\editor\images\"
xcopy /y /i "%cd%\source\revision" "C:\Users\%user%\OpenPLC_Editor\"
echo Folder copied and overwritten successfully!