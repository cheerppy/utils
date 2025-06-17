@echo off
setLocal

set dirPath=%UserProfile%\Pictures
set fileName=sample-image.png
set filePath=%dirPath%\%fileName%

set script=(Get-Clipboard -Format Image).Save("%filePath%",[System.Drawing.Imaging.ImageFormat]::Png)
@REM set script=(Get-Clipboard -Format Image).Save("%filePath%",[System.Drawing.Imaging.ImageFormat]::Jpeg)
set script=%script:"=\"%
powershell -Command "%script%"

if %ERRORLEVEL% neq 0 (
	echo.
	echo Press any key to exit . . .
	pause > nul
	exit 1
)

explorer /select,"%filePath%"
