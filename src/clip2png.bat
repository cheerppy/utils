@echo off
setLocal

set dirPath=%UserProfile%\OneDrive\画像
set fileName=sample-image.png
set filePath=%dirPath%\%fileName%

set script=(Get-Clipboard -Format Image).Save("%filePath%",[System.Drawing.Imaging.ImageFormat]::Png)
set script=%script:"=\"%
powershell -Command "%script%"

if %ERRORLEVEL% neq 0 (
	echo.
	echo Press any key to exit . . .
	pause > null
	exit 1
)

explorer /select,"%filePath%"
