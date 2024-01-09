#!/usr/bin/env bash

install_application(){
    local appname="$1"
    local app="$2"
    echo "[+] Installing $appname [+]"
    sudo apt install $app -y
}

echo "[+] Update and upgrade [+]"
sudo apt update && sudo apt upgrade -y

echo "[+] Install applications [+]"
install_application "Python v3" "python3"
install_application "Python v3 Venv" "python3.11-venv"
install_application "Python dev" "python-dev"
install_application "Emacs" "emacs"
install_application "UFW" "ufw"
install_application "Mugshot" "mugshot"
install_application "Build essential" "build-essential"
install_application "Tree" "tree"
install_application "7zip" "7zip"
install_application "Transmission" "transmission"
install_application "Alacritty" "alacritty"
install_application "Git" "git"
