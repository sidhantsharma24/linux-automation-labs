#!/bin/bash

echo "========================================="

#variable is "name" ... read -p "your message" <variable> For same line input "-p"
read -p "Enter your name: " name


echo "Hello $name! Nice to meet you :)"
echo ""

display-menu() {
    echo ""
    echo "1. Toggle WiFi"
    echo "2. Toggle Bluetooth"
    echo "3. Toggle Flashlight"
    echo "4. Switch dark mode/light mode"
    echo "5. Toggle night light"
    echo "6. Power Off"
    echo "7. Display options again."
    echo "8. Display current status."
    echo ""
}
 echo "What would you like to do?"

    display-menu



theme="Light"
flashlight="OFF"
nightLight="OFF"
poweroff="OFF"


wifiStatus="$(nmcli radio wifi)"
bluetoothStatus="$(bluetoothctl show | grep "Powered:" | awk '{print $2}')"

#enableNightLight = $(gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true)
#disableNightLight = $(gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false)


while true; do

    read -p  "Choose option: " option
    
    case $option in
    
        1)
                if [ $wifiStatus == "disabled" ]; then
                    
                    echo "  [+] Turning WiFi on..."
                    if nmcli radio wifi on; then
                        sleep 3
                        echo "  [+] WiFi turned on [.o0]"
                        wifiStatus="$(nmcli radio wifi)"
                    
                    fi
                    
                    echo "  [.] Enter 7 to display options again."
                    
                elif [ $wifiStatus == "enabled" ]; then
                    
                    echo "  [+] Turning WiFi off..."
                    if nmcli radio wifi off; then
                        sleep 3
                        echo "  [+] WiFi turned off"
                        wifiStatus="$(nmcli radio wifi)"
                    fi
                    
                    echo "  [.] Enter 7 to display options again."

                else
                    :
                fi
            ;;
        
        2)
                if bluetoothctl show | grep -q "Powered: no"; then
                    echo "  [+] Turning on bluetooth..."
                    if bluetoothctl power on; then
                        echo "  [+] Bluetooth turned on"
                        bluetoothStatus="$(bluetoothctl show | grep "Powered:" | awk '{print $2}')"
                    fi
                    
                    echo "  [.] Enter 7 to display options again."
    
                elif bluetoothctl show | grep -q "Powered: yes"; then
                    
                    echo "  [-] Turning off bluetooth..."
                    if bluetoothctl power off; then
                        echo "  [-] Bluetooth turned off"
                        bluetoothStatus="$(bluetoothctl show | grep "Powered:" | awk '{print $2}')"
                    fi

                    echo "  Enter 7 to display options again."

                fi
            ;;
        
        3)
                if [[ "$flashlight" == "OFF" ]]; then

                    echo "  [+] Flashlight turned on"
                    echo "  [.] Enter 7 to display options again."
                    

                    flashlight="ON"
                else
                    echo "  [-] Flashlight turned off"

                    
                    echo "  [.] Enter 7 to display options again."
                    

                    flashlight="OFF"
                fi
            ;;
        
        4)
                if [ "$(gsettings get org.gnome.desktop.interface color-scheme)" == "'prefer-light'" ]; then

                    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
                    echo "  [+] Switched to dark mode"

                    
                    echo "  [.] Enter 7 to display options again."

                    theme="Dark"
                    
                elif [ "$(gsettings get org.gnome.desktop.interface color-scheme)" == "'prefer-dark'" ]; then
                    
                    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
                    echo "  [+] Switched to light mode"
                    
                    echo "  [.] Enter 7 to display options again."
                    
                    theme="Light"
                else
                    :
                fi
            ;;
        
        5)
                if [[ "$nightLight" == "OFF" ]]; then
                    echo "  [+] Night Light turned on"

                    
                    echo "  [.] Enter 7 to display options again."
                    

                    nightLight="ON"
                else
                    echo "  [-] Night Light turned off"
                    
                    echo "  [.] Enter 7 to display options again."
                    
                    nightLight="OFF"
                fi
            ;;
        
        6)
                if [[ "$poweroff" == "OFF" ]]; then
                    echo "  [-] Powering off... Goodbye :("
                    poweroff="ON"
                    break
                fi
            ;;

        7)
            display-menu
             
            ;;

        8)
            echo ""
            echo "========== SYSTEM STATUS =========="
            echo "WiFI:         $wifiStatus"
            echo "Bluetooth:    $bluetoothStatus"
            echo "Flashlight:   $flashlight"
            echo "Theme:        $theme"
            echo "Night light:  $nightLight"
            echo "==================================="
            echo ""

            ;;
        
        *)
            echo "[!] Invalid option. Choose one of the listed options."
            echo "[.] Enter 7 to display options again."
            echo ""
            ;;
    
    esac

done

