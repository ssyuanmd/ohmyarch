#!/bin/bash
install_dependency() {
yes | sudo pacman -Syu
	tools=(
	"alsemixer"
	"alsa-utils"
	"base-devel"
	"cowsay"
	"clang"
	"dmenu"
	"firefox"
	"fcitx-im"
	"fcitx-configtool"
	"ninja"
	"fcitx-chewing"
	"git"
	"htop"
	"tree"
	"ranger"
	"trash-cli"
	"links"
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
#compton
yay picom-jonaburg-git
yay nerd-fonts-hack
yay nvim-packer-git

# fcitx
cowsay "fcitx"
printf "export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
" > ~/.xprofile
}
