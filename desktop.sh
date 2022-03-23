#!/bin/bash
install_desktop() {

# dotfile
git clone https://github.com/ssyuanmd/dotfile ~/

# .config
cp -r ~/dotfile/.config ~/

# fonts
sudo cp ~/dotfile/fonts/* /usr/share/fonts/

# xinitrc
cp ~/dotfile/.xinitrc ~/

# dwm
cowsay "dwm"
git clone https://git.suckless.org/dwm ~/.config/dwm
cd ~/.config/dwm && sudo make install

#feh
mkdir ~/Desktop
tar -xvf ~/dotfile/neon.tar -C ~/Desktop

echo "Desktop environment done!"
}
