#!/bin/bash

Menu(){
    echo "星が踊"
    echo "1. Install hack all tools"
    echo "2. Install dev tools and setup enviroment"
    echo "0. Exit"
    read option
    case $option in
	1) InstallTools ;;
	2) DevTools ;;
	0) exit ;;
	*) "Wrong option.. Try again!" ; echo ; Menu ;;
}

InstallTools(){
    clear
    echo "[+] Installing tools [+]"
    source setup/hack_tools.sh
}

DevTools(){
    clear
    echo "[+] Installing Dev tools and setup enviroment. [+]"
    source setup/dev_tools.sh
}

go(){
    if command -v go &> /dev/null; then
	clear
	echo "[!] Go is already installed [!]"
	sleep 2    
    else
	echo "[!] Go isn't installed [+]"
	sleep 1
	echo "[!] Enter the version of Go you want to install (e.g., 1.17.5) [!] > "
	read go_version

	wget "https://golang.org/dl/go${go_version}.linux-amd64.tar.gz"
	checksum = $(sha256sum "go{version}.linux-amd64.tar.gz | awk '{print $1}'")
	echo "[!] Enter the hash [!] > "
	read expected_sha256
	if [ "$checksum" == "$expected_sha256" ];then
	   echo "[!] Hash match [!]"
	   return 0
	else
	   echo "[+] Installing Go [+]"
	   sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "go${go_version}.linux-amd64.tar.gz"
	   if [ -f "$HOME/.zshrc" ]; then
	       echo "export PATH=\$PATH:${install_dir}/go/bin" >> "$HOME/.zshrc"
	       source "$HOME/.zshrc"
	       go version
	       echo "[!] Done. [!]"
	   elif [ -f "$HOME/.bashrc" ]; then
	       echo "export PATH=\$PATH:${install_dir}/go/bin" >> "$HOME/.bashrc"
	       source "$HOME/.bashrc"
	       go version
	       echo "[!] Done. [!]"
	   fi
       fi
    fi
}

banner
go
