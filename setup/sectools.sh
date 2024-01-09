#!/usr/bin/env bash

NO_VERBOSE = "1>>/dev/null"
DEBUG = "2>>errors.log"


DevEnviroment(){
    Golang
    Python
}


Golang(){
    echo "[+] Golang [+]"
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
    echo "[+] Python3 [+]"
    sudo apt install python3 -y
    sudo apt install python3.11-venv -y
    sudo apt install python3-pip -y
    python3 -m venv $HOME/.RARE
    source $HOME/.RARE/bin/activate
}


install_tool(){
    local toolname="$1"
    local tool="$2"
    echo "[+] Installing $toolname [+]"
    go install $tool@latest -y $NO_VERBOSE $DEBUG
}


install_tool "Assetfinder" "github.com/tomnomnom/assetfinder"
install_tool "Subfinder" "github.com/projectdiscovery/subfinder/v2/cmd/subfinder"
install_tool "Anew" "github.com/tomnomnom/anew"
install_tool "Chaos" "github.com/projectdiscovery/chaos-client/cmd/chaos"
install_tool "Httpx" "github.com/projectdiscovery/httpx/cmd/httpx"
install_tool "Httprobe" "github.com/tomnomnom/httprobe"
install_tool "Gowitness" "github.com/sensepost/gowitness"
install_tool "Waybackurls" "github.com/tomnomnom/waybackurls"
install_tool "Hakrevdns" "github.com/hakluke/hakrevdns"
install_tool "Metabigor" "github.com/j3ssie/metabigor"
install_tool "GF" "github.com/tomnomnom/gf"
install_tool "Unfurl" "github.com/tomnomnom/unfurl"


AptInstall(){
    sudo apt install git -y
    sudo apt install jq -y
    sudo snap install amass -y
    sudo apt install prips -y
    
}
