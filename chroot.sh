ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime
hwclock --systohc
printf "LANG=en_US.UTF-8" > /etc/locale.conf
printf "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen

# wheel ALL=(ALL) ALL
pacman -Sy vim
visudo
pacman -R vim

# network
pacman -Sy networkmanager
systemctl enable NetworkManager

#open root
passwd
useradd -mG wheel syuan
echo "enter your passwd syuand:"
passwd syuan
usermod -aG wheel,audio,video,optical,storage syuan

