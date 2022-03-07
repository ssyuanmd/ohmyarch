#!/bin/bash
install_desktop() {

# alacritty
cowsay "alacritty"
mkdir ~/.config/alacritty
git clone https://github.com/ssyuanmd/alacritty ~/.config/alacritty

# bash
mv ~/.config/alacritty/.bashrc ~/

# font
sudo mv ~/.config/alacritty/MonoLisa* /usr/share/fonts

#xmodmap
sudo mv ~/.config/alacritty/.xmod* ~/

# dwm
cowsay "dwm"
git clone http://github.com/ssyuanmd/dwm ~/.config/dwm
cd ~/.config/dwm && sudo make install
printf "#!/bin/bash
~/ohmyarch/script/wallpaper.sh &
~/ohmyarch/script/compton.sh &
~/ohmyarch/script/statusbar.sh &
exec fcitx &
exec dwm
" > ~/.xinitrc
cat ~/.xinitrc
sleep 12

#feh
mkdir ~/Desktop
tar -xvf ~/.config/alacritty/neon.tar -C ~/Desktop

# compton
cowsay "compton"
mkdir ~/.config/compton
mv ~/.config/alacritty/compton.conf ~/.config/compton

echo "Desktop environment done!"
}
