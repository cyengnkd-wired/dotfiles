#!/usr/bin/bash

red="\e[31m"
reset="\e[97m"

Menu(){
    clear
    echo -e "$redインストーラ$reset -$redUBUNTU$reset"
    echo "1 * Install sec tools"
    echo "2 * Install tools"
    echo "0 * Exit"
    read option
    case $option in
	1) InstallSecTools ;;
	2) InstallTools ;;
	0) exit ;;
	*) "Wrong option. Try again"; echo ; Menu ;;
    esac
}

InstallSecTools(){
    clear
    echo -e "$red[*]$reset Sec tools $red[*]$reset"
    source setup/sectools.sh
}

InstallTools(){
    clear
    echo -e "$red[*]$reset tools $red[*]$reset"
    source setup/tools.sh
}

Menu
