#!/usr/bin/bash

red="\e[31m"
reset="\e[97m"

install_app(){
    local appname="$1"
    local app="$2"
    echo -e "$red[+]$reset Installing $appname"
    sudo apt install $app -y 1>/dev/null 2>error.log
}


echo -e "$red[*]$reset Update and upgrade $red[*]$reset"
sudo apt update && sudo apt upgrade -y


clear
sleep 1
echo -e "$red[*]$reset Install applications $red[*]$reset"
install_app "Python v3" "python3"
install_app "Python Venv" "python3.11-venv"
install_app "Emacs" "emacs"
install_app "UFW" "ufw"
install_app "Mugshot" "mugshot"
install_app "Build essential" "build-essential"
install_app "Tree" "tree"
install_app "7zip" "7zip"
install_app "Transmission" "transmission"
install_app "Git" "git"
echo -e "$red[*]$reset Done. $red[*]$reset"
