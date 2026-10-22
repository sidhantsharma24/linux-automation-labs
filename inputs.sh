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
    echo ""
}
 echo "What would you like to do?"

    display-menu


wifi="false"
bluetooth="false"
mode="light"
flashlight="false"
nightLight="false"
poweroff="false"


while true; do

    read -p  "Choose option: " option
    
    case $option in
    
        1)
                if [[ "$wifi" == "false" ]]; then
                    echo "  [+] Wifi turned on [.oO] "

                    
                    echo "  [.] Enter 7 to display options again."
                    
                    wifi="true"
                    
                else
                    echo "  [-] Wifi turned off"
                    echo "  [.] Enter 7 to display options again."
            
                    wifi="false"
                    
                fi
            ;;
        
        2)
                if [[ "$bluetooth" == "false" ]]; then
                    echo "  [+] Bluetooth turned on"

                    
                    echo "  [.] Enter 7 to display options again."
    
                    bluetooth="true"
                else
                    echo "  [-] Bluetooth turned off"
                    echo "  Enter 7 to display options again."

                    bluetooth="false"
                fi
            ;;
        
        3)
                if [[ "$flashlight" == "false" ]]; then

                    echo "  [+] Flashlight turned on"
                    echo "  [.] Enter 7 to display options again."
                    

                    flashlight="true"
                else
                    echo "  [-] Flashlight turned off"

                    
                    echo "  [.] Enter 7 to display options again."
                    

                    flashlight="false"
                fi
            ;;
        
        4)
                if [[ "$mode" == "light" ]]; then
                    echo "  [+] Switched to dark mode"

                    
                    echo "  [.] Enter 7 to display options again."
                    

                    mode="dark"
                else
                    echo "  [-] Switched to light mode"

                    
                    echo "  [.] Enter 7 to display options again."
                    
                    mode="light"
                fi
            ;;
        
        5)
                if [[ "$nightLight" == "false" ]]; then
                    echo "  [+] Night Light turned on"

                    
                    echo "  [.] Enter 7 to display options again."
                    

                    nightLight="true"
                else
                    echo "  [-] Night Light turned off"
                    
                    echo "  [.] Enter 7 to display options again."
                    
                    nightLight="false"
                fi
            ;;
        
        6)
                if [[ "$poweroff" == "false" ]]; then
                    echo "  [-] Powering off... Goodbye :("
                    poweroff="true"
                    break
                fi
            ;;

        7)
            display-menu
             
            ;;
        
        *)
            echo "[!] Invalid option. Choose one of the listed options."
            echo "[.] Enter 7 to display options again."
            echo ""
            ;;
    
    esac

done

