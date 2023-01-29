#!/bin/bash
# ------------------------------------------------------------------------------------------------------------- #
# AUTOR: Juracy Neto
# NOME:  zorin-os-post-install.sh	
# CHANGELOG: Última edição 29/01/2023
# ------------------------------------------------------------------------------------------------------------- #
echo "Qual versão deseja executar? Escolha D para desktop (zorin os 16.2 core) ou N para Notebook (zorin os 16.2 xfce) - D/N"
read Desktop

if [ "$Desktop" == "D" ]; then

echo 'Rodando a versão Desktop (zorin os 16.2 core) do Script!'
## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock;
echo 'As travas do apt foram removidas'

## Atualizando o repositório ##
sudo apt update ; sudo apt dist-upgrade -y
echo 'Os repositórios foram atualizados'

## Removendo pacotes desnecessários ##
sudo apt-get purge pitivi pacman aisleriot firefox xfburn rhythmbox parole gnome-sudoku gnome-mahjongg gnome-mines -y
echo 'Os pacotes desnecessários foram removidos'

## Wine e PlayOnLinux ##
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-get install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
sudo wget http://deb.playonlinux.com/playonlinux_bionic.list -O /etc/apt/sources.list.d/playonlinux.list
sudo apt-get install playonlinux -y
sudo apt update && sudo apt upgrade -y
echo 'Wine e PlayOnLinux foram instalados'

## Download de programas externos ##
mkdir /home/$USER/Downloads/autoinstalação
cd /home/$USER/Downloads/autoinstalação
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -c https://github.com/gaining/Resetter/releases/download/v3.0.0-stable/resetter_3.0.0-stable_all.deb
echo 'Programas externos foram baixados'

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i *.deb 
echo 'Os pacotes .deb baixados na sessão anterior foram instalados'

## Instalando pacotes Apt ##
sudo apt install git synaptic gparted gnome-tweak-tool gnome-sushi aptitude gdebi-core ubuntu-restricted-extras libavcodec-extra usb-creator-gtk -y
echo 'Os pacotes Apt foram instalados'

## Instalando pacotes Flatpak ##
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.github.mmstick.FontFinder com.visualstudio.code com.valvesoftware.Steam org.inkscape.Inkscape org.videolan.VLC
org.qbittorrent.qBittorrent org.flameshot.Flameshot io.github.liberodark.OpenDrive org.gnome.gedit org.gnome.Chess com.github.bajoja.indicator-kdeconnect -y
echo 'Os pacotes Flatpak foram instalados'

## Instalando pacotes Snap ##
sudo apt-get install snapd -y
sudo snap install photogimp
echo 'Os pacotes Snap foram instalados'

## Instalando pacotes Ppa ##
sudo add-apt-repository ppa:gezakovacs/ppa ppa:libreoffice/ppa
sudo apt-get update
sudo apt-get install unetbootin
sudo apt-get dist-upgrade
echo 'Os pacotes PPA foram instalados'

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza ##
echo 'Finalização, atualização e limpeza'
sudo apt update && sudo apt dist-upgrade -y
flatpak update -y
sudo apt autoclean
sudo apt autoremove -y
echo "INSTALAÇÃO CONCLUÍDA COM SUCESSO!"
echo "AGORA É SÓ CURTIR"
# ---------------------------------------------------------------------- #

else
echo 'Rodando a versão Notebook (zorin os 16.2 xfce) do Script!'
## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock;
echo 'As travas do apt foram removidas'$

## Atualizando o repositório ##
sudo apt update ; sudo apt dist-upgrade -y
echo 'Os repositórios foram atualizados'

## Removendo pacotes desnecessários ##
sudo apt-get purge pitivi pacman aisleriot firefox xfburn rhythmbox parole gnome-sudoku gnome-mahjongg gnome-mines -y
echo 'Os pacotes desnecessários foram removidos'

## Wine e PlayOnLinux ##
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-get install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
sudo wget http://deb.playonlinux.com/playonlinux_bionic.list -O /etc/apt/sources.list.d/playonlinux.list
sudo apt-get install playonlinux -y
sudo apt update && sudo apt upgrade -y
echo 'Wine e PlayOnLinux foram instalados'

## Instalando pacotes Apt ##
sudo apt-get install git -y
echo 'Os pacotes Apt foram instalados'

## Instalando Flatpak ##
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.visualstudio.code org.videolan.VLC com.brave.Browser org.gnome.gedit org.gnome.Chess com.system76.Popsicle com.github.bajoja.indicator-kdeconnect -y
echo 'Os pacotes Flatpak foram instalados'

## Instalando PPA ##
sudo add-apt-repository ppa:gezakovacs/ppa ppa:libreoffice/ppa
sudo apt-get update
sudo apt-get install unetbootin
sudo apt-get dist-upgrade
echo 'Os pacotes PPA foram instalados'

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update -y
sudo apt autoclean
sudo apt autoremove -y
echo "INSTALAÇÃO CONCLUÍDA COM SUCESSO!"
echo "AGORA É SÓ CURTIR"
# ---------------------------------------------------------------------- #
fi
