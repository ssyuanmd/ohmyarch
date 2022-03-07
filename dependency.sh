#!/bin/bash
install_dependency() {
yes | sudo pacman -Syu
	tools=(
	"alsemixer"
	"alsa-utils"
	"base-devel"
	"cowsay"
	"firefox"
	"fcitx-im"
	"fcitx-configtool"
	"ninja"
	"fcitx-chewing"
	"git"
	"htop"
	"ranger"
	"trash-cli"
	"xorg-server"
	"xorg-xinit"
	"xorg-xrandr"
	"libxinerama"
	"libxft"
	"base-devel"
	"feh"
	"alacritty"
	"neovim"
	)
for tool in ${tools[@]}; do
	sudo pacman -S --needed --noconfirm $tool
done


# AUR
cowsay "AUR"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -Sy compton-tryone
yay -Sy noto-fonts-sc
yay -Sy nerd-fonts-hack
yay -Sy nvim-packer-git

# fcitx
cowsay "fcitx"
printf "export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
" > ~/.xprofile
fcitx-configtool

exec bash
}
