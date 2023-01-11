set gitdir=%CD%\pgit
set path=%gitdir%\cmd;%path%
if exist .\new_editor\ rmdir /s /Q new_editor
if exist .\SCISONIC-PLC_Editor\ rmdir /s /Q SCISONIC-PLC_Editor
git clone https://github.com/Microver-Electronics/SCISONIC-PLC_Editor
if exist .\SCISONIC-PLC_Editor\editor\ (
  move .\SCISONIC-PLC_Editor\editor .\new_editor
  move .\SCISONIC-PLC_Editor\matiec\lib .\new_lib
  copy /y .\SCISONIC-PLC_Editor\revision .\
  rmdir /s /Q SCISONIC-PLC_Editor
  echo "Update applied successfully"
) else (
  echo "Error cloning from repository!"
)
