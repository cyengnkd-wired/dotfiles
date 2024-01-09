#!/usr/bin/env bash

NO_VERBOSE = "1>>/dev/null"
DEBUG = "2>>erros.txt"


DevEnviroment(){
    Golang
    sudo apt install python3.11-venv -y
    sudo atp install python3-pip -y
}

Golang(){
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
	       echo "[!] Go installed. [!]"
	   fi
	fi
fi
}

Python(){
    sudo apt install python3
    sudo apt install python3.11-venv -y
    sudo apt install python3-pip -y
    python3 -m venv $HOME/.Space
    source $HOME/.Space/bin/activate
    
}

Tools(){
    go install github.com/tomnomnom/assetfinder@latest $NO_VERBOSE $DEBUG
    go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest $NO_VERBOSE $DEBUG
    go install github.com/tomnomnom/anew@latest $NO_VERBOSE $DEBUG
    go install github.com/projectdiscovery/chaos-client/cmd/chaos@latest $NO_VERBOSE $DEBUG
    go install github.com/projectdiscovery/httpx/cmd/httpx@latest $NO_VERBOSE $DEBUG
    go install github.com/tomnomnom/httprobe@latest $NO_VERBOSE $DEBUG
    go install github.com/sensepost/gowitness@latest $NO_VERBOSE $DEBUG
    go install github.com/tomnomnom/waybackurls@latest $NO_VERBOSE $DEBUG
    go install github.com/hakluke/hakrevdns@latest $NO_VERBOSE $DEBUG
    go install github.com/j3ssie/metabigor@latest $NO_VERBOSE $DEBUG
    go install github.com/tomnomnom/gf@latest $NO_VERSION $DEBUG
    go install github.com/tomnomnom/unfurl@latest $NO_VERSION $DEBUG
    
    
}

AptInstall(){
    sudo apt install jq -y
    sudo snap install amass -y
    sudo apt install prips -y
}

Clone(){
    
}
