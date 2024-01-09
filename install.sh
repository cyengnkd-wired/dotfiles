#!/usr/bin/bash

Menu(){
    echo "星が踊"
    echo "1. Install sec tools"
    echo "2. Install tools"
    echo "0. Exit"
    read option
    case $option in
	1) InstallSecTools ;;
	2) InstallTools ;;
	0) exit ;;
	*) "Wrong option.. Try again!" ; echo ; Menu ;;
}

InstallTools(){
    clear
    echo "[+] Installing sec tools [+]"
    source setup/sectools.sh
}

InstallSecTools(){
    clear
    echo "[+] Installing tools [+]"
    source setup/tools.sh
}

Menu
