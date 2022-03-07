#!/bin/bash
install_dependency() {
yes | sudo pacman -Syu
	tools=(
	"alsemixer"
	"alsa-utils"
	"base-devel"
	"cowsay"
	"clang"
	"firefox"
	"fcitx-im"
	"fcitx-configtool"
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
yes | yay -Sy compton-tryone
yes | yay -Sy noto-fonts-sc
yes | yay -Sy nerd-fonts-hack
yes | yay -Sy nvim-packer-git

# fcitx
cowsay "fcitx"
printf "export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
" > ~/.xprofile
fcitx-configtool

exec bash
}
