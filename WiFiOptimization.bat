@echo off
:: ===============================================
:: Wi-Fi Range and Speed Optimization Script
:: Powered by Oblivion Development & Hosting
:: ===============================================

:: Display current Wi-Fi adapter settings
echo Displaying current Wi-Fi adapter settings...
netsh wlan show interfaces
echo.

:: Reset the wireless adapter for better performance
echo Disabling and re-enabling Wi-Fi adapter...
netsh interface set interface "Wi-Fi" admin=disable
timeout /t 5
netsh interface set interface "Wi-Fi" admin=enable
echo.

:: Set the wireless network mode to N or AC for better speed
echo Configuring wireless mode to N/AC for optimal speed...
netsh wlan set hostednetwork mode=allow
netsh wlan set hostednetwork ssid=Your_SSID key=Your_Password
echo.

:: Disable Wi-Fi power saving to prevent speed throttling
echo Disabling Wi-Fi power saving...
powercfg -energy
echo Disabling Wi-Fi adapter power saving settings...
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
echo.

:: Optimizing Wi-Fi Channel (For 2.4GHz band: set channels 1, 6, or 11 for best performance)
:: You will need to manually log into the router to adjust this setting
echo Suggesting optimal Wi-Fi channel for 2.4GHz...
echo - Channels 1, 6, or 11 typically offer the best performance for 2.4GHz networks.
echo - For 5GHz, channels between 36 and 48 are ideal for less interference.
echo.

:: Set DNS to Google Public DNS for faster name resolution
echo Configuring Google Public DNS...
netsh interface ip set dns "Wi-Fi" static 8.8.8.8
netsh interface ip add dns "Wi-Fi" 8.8.4.4 index=2
echo.

:: Disable TCP/IP auto-tuning for a more stable connection
echo Disabling TCP/IP auto-tuning...
netsh interface tcp set global autotuning=disabled
echo.

:: Disable Large Send Offload (LSO) to improve performance
echo Disabling Large Send Offload (LSO)...
netsh interface tcp set global chimney=disabled
netsh interface tcp set global rss=disabled
echo.

:: Set Maximum Transmission Unit (MTU) to 1500 for optimal speed
echo Setting MTU to 1500 for Wi-Fi...
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
echo.

:: Reset the wireless network profile
echo Resetting Wi-Fi network profile to remove potential interference...
netsh wlan delete profile name="Your_SSID"
echo.

:: Verify applied settings and check for issues
echo Verifying Wi-Fi performance...
netsh wlan show interfaces
echo.

:: Final message
echo ===============================================
echo Wi-Fi optimization completed successfully!
echo For best results, ensure your router is configured with an optimal channel.
echo Script powered by Oblivion Development & Hosting.
echo ===============================================
pause
