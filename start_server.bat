@echo off
title Hytale Server - JPtale

set MIN_RAM=8G
set MAX_RAM=40G

set HYTALE_PATH=%APPDATA%\Hytale\install\release\package\game\latest
set SERVER_JAR=%HYTALE_PATH%\Server\HytaleServer.jar
set ASSETS_PATH=%HYTALE_PATH%\Assets.zip

set SERVER_PORT=5520

echo.
echo  ========================================
echo   Hytale Server (Optimized)
echo  ========================================
echo.

java -Xms%MIN_RAM% -Xmx%MAX_RAM% -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=50 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 --enable-native-access=ALL-UNNAMED -jar "%SERVER_JAR%" --assets "%ASSETS_PATH%" --bind 0.0.0.0:%SERVER_PORT%

pause
