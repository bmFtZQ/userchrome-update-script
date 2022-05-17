@REM temp dir used to store downloaded/extracted files before copying
set TEMPCHROMEDIR=%Temp%\userchrome
@REM find profile dir in about:profiles "root directory"
set PROFILEDIR=C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\xxxxxxxx.default-release
@REM file to download
set UPDATEURL=https://github.com/bmFtZQ/edge-frfox/archive/refs/heads/main.tar.gz

@REM make temp dir
mkdir %TEMPCHROMEDIR%
@REM download file using curl
curl -Lo "%TEMPCHROMEDIR%\theme.tar.gz" "%UPDATEURL%"
@REM extract archive into temp dir
tar -xf "%TEMPCHROMEDIR%\theme.tar.gz" --strip 1 -C "%TEMPCHROMEDIR%"
@REM remove existing chrome dir
rmdir "%PROFILEDIR%\chrome\" /Q/S
@REM copy chrome folder to profile
xcopy "%TEMPCHROMEDIR%\chrome" "%PROFILEDIR%\chrome\" /E/Y
@REM remove temp dir
rmdir "%TEMPCHROMEDIR%" /Q/S
