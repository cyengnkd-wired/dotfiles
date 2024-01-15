#!/bin/bash

red="\e[31m"
reset="\e[97m"

install_app() {
    local appname="$1"
    local app="$2"
    echo -e "$red[+]$reset Installing $appname"
    sudo apt install "$app" -y 1>/dev/null 2>error_apt.log
}

install_snap_app() {
    local appname="$1"
    local snap_app="$2"
    echo -e "$red[+]$reset Installing $appname"
    sudo snap install "$snap_app" 1>/dev/null 2>error_snap.log
}

go_tool() {
    local tool_name="$1"
    local tool="$2"
    echo -e "$red[+]$reset Installing $tool_name"
    go install "$tool@latest" 1>/dev/null 2>go_tool_error.log
}

Tools() {
    echo
    sleep 1
    echo -e "$red[*]$reset Python settings $red[*]$reset"
    install_app "Python version 3" "python3"
    install_app "Python 3.11-venv" "python3.10-venv"
    install_app "Package manager" "python3-pip"
    echo
    echo -e "$red[*]$reset Virtual environment $red[*]$reset"
    mkdir $HOME/.virtualenvs
    python3 -m venv "$HOME/.virtualenvs/sec"
    source $HOME/.virtualenvs/sec/bin/activate
    pip3 install -r requirements.txt 1>/dev/null 2>pip_error.log
    echo
    echo -e "$red[*]$reset APT Tools $red[*]$reset"
    install_app "jq" "jq"
    install_app "Git" "git"
    install_app "curl" "curl"
    
    echo -e "$red[*]$reset Snap apps $red[*]$reset"
    install_snap_app "Amass" "amass"
    echo
    if command -v go &>/dev/null; then
        echo -e "$red[*]$reset Go is already installed $red[*]$reset"
        sleep 1
    else
        echo -e "$red[!] Golang isn't installed [!]$reset"
        sleep 1
        echo "[!] Enter the version of Go you want to install (e.g., 1.17.5) [!] > "
        read -r go_version

        wget -q --show-progress "https://golang.org/dl/go${go_version}.linux-amd64.tar.gz"
        user_sha256=$(sha256sum "go${go_version}.linux-amd64.tar.gz" | awk '{print $1}')
        echo "[!] Enter the hash [!] > "
        read -r expected_sha256
        echo -e "[*****]\n$user_sha256\n$expected_sha256\n[*****]"
        if [ "$user_sha256" == "$expected_sha256" ]; then
            echo "[!] Hash match [!]"
            echo "[+] Installing Go [+]"
            sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "go${go_version}.linux-amd64.tar.gz"
            echo "go installed"
            if [ -f "$HOME/.zshrc" ]; then
                export PATH=$PATH:/usr/local/go/bin
                echo "export PATH=\$PATH:/usr/local/go/bin" >> "$HOME/.zshrc"
                source "$HOME/.zshrc"
                go version
                echo "[!] Done. [!]"
            elif [ -f "$HOME/.bashrc" ]; then
                export PATH=$PATH:/usr/local/go/bin
                echo "export PATH=\$PATH:/usr/local/go/bin" >> "$HOME/.bashrc"
                source "$HOME/.bashrc"
                go version
                echo "[!] Go installed [!]"
            fi
        fi
    fi

    sleep 1
    echo -e "$red[*]$reset Sectools $red[*]$reset"
    go_tool "Assetfinder" "github.com/tomnomnom/assetfinder"
    go_tool "Subfinder" "github.com/projectdiscovery/subfinder/v2/cmd/subfinder"
    go_tool "Anew" "github.com/tomnomnom/anew"
    go_tool "Chaos" "github.com/projectdiscovery/chaos-client/cmd/chaos"
    go_tool "Httpx" "github.com/projectdiscovery/httpx/cmd/httpx"
    go_tool "Httprobe" "github.com/tomnomnom/httprobe"
    go_tool "Gowitness" "github.com/sensepost/gowitness"
    go_tool "Waybackurls" "github.com/tomnomnom/waybackurls"
    go_tool "Hakrevdns" "github.com/hakluke/hakrevdns"
    go_tool "Metabigor" "github.com/j3ssie/metabigor"
    go_tool "GF" "github.com/tomnomnom/gf"
    go_tool "DNSX" "github.com/projectdiscovery/dnsx/cmd/dnsx"
    go_tool "gau" "github.com/lc/gau/v2/cmd/gau"
    go_tool "Unfurl" "github.com/tomnomnom/unfurl"
    go_tool "Goop" "github.com/deletescape/goop"
    go_tool "Hakcheckrul" "github.com/hakluke/hakcheckurl"
    go_tool "Meg" "github.com/tomnomnom/meg"
    go_tool "Nuclei" "github.com/projectdiscovery/nuclei/v3/cmd/nuclei"
    go_tool "sdlookup" "github.com/j3ssie/sdlookup"
    go_tool "PureDNS" "github.com/d3mondev/puredns/v2"
    go_tool "xurlfind3r" "github.com/hueristiq/xurlfind3r/cmd/xurlfind3r"
    go_tool "subjs" "github.com/lc/subjs"
    go_tool "qsreplace" "github.com/tomnomnom/qsreplace"
    go_tool "JSubfinder" "github.com/ThreatUnkown/jsubfinder"
    go_tool "getJS" "github.com/003random/getJS"
    go_tool "Notify" "github.com/projectdiscovery/notify/cmd/notify"
}

Tools
