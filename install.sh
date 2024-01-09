#!/bin/bash

Menu(){
    echo "星が踊"
    echo "1. Install hack all tools"
    echo "0. Exit"
    read option
    case $option in
	1) InstallTools ;;
	0) exit ;;
	*) "Wrong option.. Try again!" ; echo ; Menu ;;
}

InstallTools(){
    clear
    echo "[+] Installing tools [+]"
    source setup/tools.sh
}

Menu
