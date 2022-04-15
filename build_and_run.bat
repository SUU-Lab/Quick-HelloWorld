@echo off

set CURRENT=%~dp0

set BUILD_DIR=%CURRENT%\build
set CONFIGURATION=Debug

echo "===== Generate ====="
cmake.exe ^
-H%CURRENT% ^
-G "Visual Studio 17 2022" ^
-A x64 ^
-DCMAKE_BUILD_TYPE=%CONFIGURATION% ^
-B%BUILD_DIR% ^
-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=lib ^
-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=bin

echo "===== Build ====="
cmake.exe --build %BUILD_DIR%

echo "===== Run ====="
%BUILD_DIR%\bin\%CONFIGURATION%\test_app.exe
