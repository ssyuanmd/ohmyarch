#!/bin/bash
install_desktop() {

# dotfile
git clone https://github.com/ssyuanmd/dotfile ~/

# .bashrc
cp ~/dotfile/.bashrc ~/
sudo cp ~/dotfile/.bashrc /root

# .config
cp -r ~/dotfile/.config ~/
sudo cp -r ~/dotfile/.config /root

# fonts
sudo cp ~/dotfile/fonts/* /usr/share/fonts/

# xinitrc
cp ~/dotfile/.xinitrc ~/

# dwm
echo "DWM" | figlet
git clone https://git.suckless.org/dwm ~/.config/dwm
cp ~/dotfile/config.h ~/.config/dwm
cd ~/.config/dwm && sudo make install

#feh
mkdir ~/Desktop
tar -xvf ~/dotfile/neon.tar -C ~/Desktop

echo "Desktop environment done!"
}
