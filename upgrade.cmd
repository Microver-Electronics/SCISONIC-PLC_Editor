@echo off
setlocal enabledelayedexpansion
set user=%USERNAME%
set cd=%CD%
xcopy /y "%cd%\source\MicroBCM.cpp" "C:\Users\%user%\OpenPLC_Editor\editor\arduino\src\hal\"
xcopy /y "%cd%\source\MicroBCM.hal" "C:\Users\%user%\OpenPLC_Editor\editor\arduino\src\hal\"
xcopy /y "%cd%\source\builder.py" "C:\Users\%user%\OpenPLC_Editor\editor\arduino\"
xcopy /y "%cd%\source\hals.json" "C:\Users\%user%\OpenPLC_Editor\editor\arduino\examples\Baremetal\"
xcopy /y "%cd%\source\splash.png" "C:\Users\%user%\OpenPLC_Editor\editor\images\"
xcopy /y "%cd%\source\arduino.png" "C:\Users\%user%\OpenPLC_Editor\editor\images\"
xcopy /y "%cd%\source\revision" "C:\Users\%user%\OpenPLC_Editor\"
echo Folder copied and overwritten successfully!