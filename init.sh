#!/bin/bash
DIR=$(pwd)
. "$DIR/dependency.sh"
. "$DIR/desktop.sh"
. "$DIR/neovim.sh"
. "$DIR/check.sh"

config_mirror () {
    PACMAN_MIRROR=$(cat /etc/pacman.d/mirrorlist)
    if [[ $PACMAN_MIRROR != *"nctu"* ]]; then
        sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
        sudo echo 'Server = https://archlinux.cs.nctu.edu.tw/$repo/os/$arch' > /etc/pacman.d/mirrorlist
    fi
	sudo pacman -Sy
}

# config all shit
mkdir ~/.config
if [[ $1 == "check" ]]; then
	check_all
elif [[ $1 == "dependency" ]]; then
	install_dependency
elif [[ $1 == "desktop" ]]; then
	install_desktop
elif [[ $1 == "neovim" ]]; then
	install_neovim
else
	install_dependency
	install_desktop
	install_neovim
	check_all
fi
