#! /bin/bash

BLU='\033[0;34m'
RED='\033[1;31m'
GREN='\033[0;32m'
GREEN='\033[38;5;82m'
NC='\033[0m' # No Color
bold=$(tput bold)
normal=$(tput sgr0)
echo
echo -e ${BLU}" This script \n - checks for profiles, \n - seals this unit \n - deletes Mac Info App \n - Finally deletes itself."${NC}
echo 
echo  -e ${BLU}"-------------------------- Checking Profiles  ------------------------------"${NC}
echo
FILE1=/var/db/ConfigurationProfiles/Settings/.cloudConfigHasActivationRecord 2>/dev/null
FILE2=/var/db/ConfigurationProfiles/.cloudConfigHasActivationRecord 2>/dev/null
FILE3=/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordFound 2>/dev/null
FILE4=/var/db/ConfigurationProfiles/Settings/.cloudConfigProfileInstalled 2>/dev/null


echo "Is OSX El-Capitan installed on this unit? Enter (y) for yes or (n) for No \"Case Sensitive\")"
read resp
if [ "$resp" == "y" ]; then
    
	if test -f "$FILE1"; then
        sleep 1       
        echo " "
        echo -e ${RED}${bold}"This unit has Profiles"${normal}${NC}
        echo " "       
        echo  -e ${BLU}"-------------------------- Done Checking Profiles  -------------------------"${NC} 
	elif test -f "$FILE2"; then
        sleep 1        
        echo " "
        echo -e ${RED}${bold}"This unit has Profiles"${normal}${NC}
        echo " "
        echo " "
        echo  -e ${BLU}"-------------------------- Done Checking Profiles  -------------------------"${NC} 
	elif test -f "$FILE3"; then
        sleep 1       
        echo " "
        echo -e ${RED}${bold}"This unit has Profiles"${normal}${NC}
        echo " "
        echo " "
        echo  -e ${BLU}"-------------------------- Done Checking Profiles  -------------------------"${NC} 
	elif test -f "$FILE4"; then
        sleep 1        
        echo " "
        echo -e ${RED}${bold}"This unit has Profiles"${normal}${NC}
        echo " "
        echo " "
        echo  -e ${BLU}"-------------------------- Done Checking Profiles  -------------------------"${NC} 
	else
        sleep 2
        echo " "
        echo -e ${GREEN}${bold}"No Profiles installed"${normal}${NC}
        echo " "
        echo  -e ${BLU}"-------------------------- Done Checking Profiles  -------------------------"${NC} 
	fi
else
	sleep 1
	sudo profiles -e 2>/dev/null
    	if test -f "$FILE1"; then
        sleep 1	       
        echo " "
        echo -e ${RED}${bold}"This unit has profiles"${normal}${NC}
        echo " "
        echo  -e ${BLU}"-------------------------- Done Checking Profiles  -------------------------"${NC} 
	elif test -f "$FILE2"; then
        sleep 1     
        echo " "
        echo -e ${RED}${bold}"This unit has Profiles"${normal}${NC}
        echo " "        
        echo  -e ${BLU}"-------------------------- Done Checking Profiles  -------------------------"${NC} 
	elif test -f "$FILE3"; then
        sleep 1        
        echo " "
        echo -e ${RED}${bold}"This unit has Profiles"${normal}${NC}
        echo " "
        echo " "
        echo  -e ${BLU}"-------------------------- Done Checking Profiles  -------------------------"${NC} 
	elif test -f "$FILE4"; then
        sleep 1        
        echo " "
        echo -e ${RED}${bold}"This unit has Profiles"${normal}${NC}
        echo " "
        echo " "
        echo  -e ${BLU}"-------------------------- Done Checking Profiles  -------------------------"${NC} 
	else
        sleep 1
        echo " "
        echo -e ${GREEN}${bold}"No Profiles installed"${normal}${NC}
        echo " "
        echo  -e ${BLU}"-------------------------- Done Checking Profiles  -------------------------"${NC}
    	fi
fi
echo " "
echo ${bold}"Directory Contents"${normal}
echo " "
ls -a1 /var/db/ConfigurationProfiles/Settings/
ls -a1 /var/db/ConfigurationProfiles/
echo " "
echo " "
echo  -e ${BLU}"----------------------- Sealing Unit & Cleaning up -------------------------"${NC}
echo " "
echo " "

echo " "
echo " "
echo "Sealing MacOS is what out of box experience for Windows computers when OS is freshly installed"
echo " "
echo "Do you want to seal the MacOS? (y / n)"
read rsp
if [ "$rsp" == "y" ]; then
    FILE30=/var/db/.AppleSetupDone 2>/dev/null
    echo " "
	echo "Sealing OS"
    echo " "
    sleep 2
    if test -f "$FILE30"; then
        sleep 1
        sudo rm /var/db/.AppleSetupDone
        sleep 1
        echo " "
        echo "Verifying if unit is sealed successfully. Please wait ..."
        echo " "
        sleep 2
        if test -f "$FILE30"; then
            echo " "
            echo -e ${RED}${bold}"Verification failed. Unit is still not sealed"${normal}${NC}
            echo " "
        else
            echo " "
            echo -e ${GREEN}${bold}"Verification complete. Unit is sealed."${normal}${NC}
            echo " "
            echo " "
            echo  -e ${BLU}"---------------     Now beginning cleanup process      -----------------"${NC}
            echo " "
            echo " "
            echo "Do you want to delete this script also? (y / n)"
            read rsp1
            if [ "$rsp1" == "y" ]; then
                #sudo rm -- "$0" # This will delete this command file itself
		killall Terminal
                echo  -e ${BLU}"---------------     Finished cleaning up      -----------------"${NC}
            else
                echo  -e ${BLU}"---------------     Script not deleted      -----------------"${NC}
            fi
        fi
    else
        echo " "
	    echo -e ${GREEN}${bold}"OS is already sealed"${normal}${NC}
        echo " "
        
    fi
else
    echo " "
	echo -e ${RED}${bold}"OS is not sealed. Exiting Now"${normal}${NC}
    echo " "
	sleep 1
	#killall Terminal
fi
exit


