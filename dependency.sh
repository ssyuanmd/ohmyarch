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
https://github.com/tryone144/compton ./compton
cd compton
make
make install
yay -Sy nerd-fonts-hack
yay -Sy nvim-packer-git

# fcitx
cowsay "fcitx"
printf "export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
" > ~/.xprofile
}
