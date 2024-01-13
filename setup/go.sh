#!/usr/bin/env bash

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

	wget -q --show-progress "https://golang.org/dl/go${go_version}.linux-amd64.tar.gz"
	user_sha256=$(sha256sum "go${go_version}.linux-amd64.tar.gz" | awk '{print $1}')
	echo "[!] Enter the hash [!] > "
	read expected_sha256
	echo -e "$user_sha256\n$expected_sha256"
	if [ "$user_sha256" == "$expected_sha256" ];then
	   echo "[!] Hash match [!]"
	   echo "[+] Installing Go [+]"
	   sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "go${go_version}.linux-amd64.tar.gz"
	   echo "go installed"
	   if [ -f "$HOME/.zshrc" ]; then
	       echo "export PATH=\$PATH:${install_dir}/go/bin" >> "$HOME/.zshrc"
	       source "$HOME/.zshrc"
	       go version
	       echo "[!] Done. [!]"
	   elif [ -f "$HOME/.bashrc" ]; then
	       echo "export PATH=$PATH:/usr/local/go/bin" >> "$HOME/.bashrc"
	       source "$HOME/.bashrc"
	       go version
	       echo "[!] Go installed [!]"
	   fi
	fi
fi
}
Golang
