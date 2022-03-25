#!/bin/bash
install_dependency() {
echo "dependency" | figlet
yes | sudo pacman -Syu
	tools=(
	"acpi"
	"alsemixer"
	"alsa-utils"
	"base-devel"
	"figlet"
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
echo "AUR" | figlet
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
# picom
yay ly-git
yay picom-jonaburg-git
yay nerd-fonts-hack
yay nvim-packer-git

# fcitx
printf "export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
" > ~/.xprofile
}
