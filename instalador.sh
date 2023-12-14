#!/bin/bash

APPS_INSTALADOS=""

BASHRC_PATH="/home/edson/"
BASHRC_FILE="${BASHRC_PATH}.bashrc"
BASHRC_BKP="${BASHRC_PATH}.bashrc-bkp-$(date +%d-%m-%Y-%H-%M-%S)"
cp $BASHRC_FILE $BASHRC_BKP
echo -e "alias atualizar=\"sudo apt update -y && sudo apt upgrade -y\"" >> $BASHRC_FILE
source $BASHRC_FILE
APPS_INSTALADOS="${APPS_INSTALADOS}\n - Aliases;"

# GIT
sudo apt install git -y
sudo apt update && sudo apt upgrade -y
APPS_INSTALADOS="${APPS_INSTALADOS}\n - Git;"

# DOCKER
# Add GPG key oficial Docker
sudo apt update
sudo apt install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
# Add o repositorio ao apt
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt upgrade -y
# Instala o docker
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo usermod -aG docker $USER
sudo apt update && sudo apt upgrade -y
APPS_INSTALADOS="${APPS_INSTALADOS}\n - Docker;"

# VSCODE
# Instalar chave do repositorio apt sources
sudo apt install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
# Instalar VsCode
sudo apt install apt-transport-https -y
sudo apt update && sudo apt upgrade -y
sudo apt install code -y # or code-insiders
sudo apt update && sudo apt upgrade -y
APPS_INSTALADOS="${APPS_INSTALADOS}\n - VsCode;"

# STEAM
wget https://repo.steampowered.com/steam/archive/precise/steam_latest.deb
sudo apt --fix-broken install ./steam_latest.deb -y
sudo rm steam_latest.deb
sudo apt update && sudo apt upgrade -y
APPS_INSTALADOS="${APPS_INSTALADOS}\n - Steam;"

# GIMP
sudo apt install gimp -y
sudo apt update && sudo apt upgrade -y
APPS_INSTALADOS="${APPS_INSTALADOS}\n - Gimp;"

# GOOGLE CHROME
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install ./google-chrome-stable_current_amd64.deb -y
sudo apt update && sudo apt upgrade -y
sudo rm google-chrome-stable_current_amd64.deb
APPS_INSTALADOS="${APPS_INSTALADOS}\n - Google Chrome;"

# SPOTIFY LINK: https://www.spotify.com/br-pt/download/linux/
# Configure our debian repository
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt upgrade -y
sudo apt install spotify-client -y
sudo apt update && sudo apt upgrade -y
APPS_INSTALADOS="${APPS_INSTALADOS}\n - Spotify;"

# DOTNET CORE LINK: https://learn.microsoft.com/pt-br/dotnet/core/install/linux-debian
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update && sudo apt upgrade
sudo apt install -y dotnet-sdk-7.0
sudo apt update && sudo apt upgrade
#sudo apt install -y aspnetcore-runtime-7.0
sudo apt install -y dotnet-runtime-7.0
APPS_INSTALADOS="${APPS_INSTALADOS}\n - DotNet Core.\n"

echo -e "Apps instalados:\n"
echo -e $APPS_INSTALADOS