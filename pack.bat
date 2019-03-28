

set script_path=%~dp0
set current_dir=%script_path:~0,-1%
set target_dir_name=bin
set target_dir=%current_dir%\%target_dir_name%
set exercise_dir=%current_dir%\exercises\exe1
set zip_name=exe1

if not exist %target_dir% mkdir %target_dir%
if %ERRORLEVEL% == 1 (
    echo failed to create the directory: %target_dir%
	pause
	exit 1
)

xcopy /y %current_dir% %target_dir%
if %ERRORLEVEL% == 1 (
    echo failed to copy files to the directory: %target_dir%
	pause
	exit 1
) else (
	echo files have been successfully copied from %current_dir% to %target_dir%
)

set file_to_remove=pack.bat
del /F %target_dir%\%file_to_remove%
if %ERRORLEVEL% == 1 (
    echo failed to delete %file_to_remove% from the target directory: %target_dir%
	pause
	exit 1
) else (
	echo %file_to_remove% has been successfully removed from the target directory: %target_dir%
)

xcopy /y %exercise_dir% %target_dir%
if %ERRORLEVEL% == 1 (
    echo failed to copy exercise files to the directory: %target_dir%
	pause
	exit 1
) else (
	echo exercise  have been successfully copied from %exercise_dir% to %target_dir%
)

REM for /d %%a in (%target_dir%) do (ECHO zip -r -p "%%~na.zip" ".\%%a\*")

REM for /d %%X in (%target_dir%) do (for /d %%a in (%%X) do ( "C:\Program Files\7-Zip\7z.exe" a -tzip "%%X.zip" ".\%%a\" ))


for /d %%X in (%target_dir%\) do "c:\Program Files\7-Zip\7z.exe" a "%zip_name%.zip" "%%X\"


