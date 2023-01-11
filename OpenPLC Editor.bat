@echo off
echo "Starting OpenPLC Editor..."
cd "OpenPLC Editor"
if exist .\new_editor\ (
  rmdir /s /q .\editor
  rmdir /s /q .\matiec\lib
  move .\new_editor .\editor
  move .\new_lib .\matiec\lib
)
start "" ".\python\pythonw.exe" ".\editor\Beremiz.py"