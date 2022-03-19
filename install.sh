#!/bin/bash
ping -c 3 google.com
timedatectl set-ntp true
timedatectl status
cfdisk /dev/sda
#pacman color
echo "Color" >> /etc/pacman.conf
echo "ILoveCandy" >> /etc/pacman.conf

# format
mkfs.vfat /dev/sda1
swapoff /dev/sda2
mkswap /dev/sda2
swapon /dev/sda2
y|mkfs.ext4 /dev/sda3
y|mkfs.ext4 /dev/sda4

# mount
mount /dev/sda3 /mnt
mkdir /mnt/boot /mnt/home
mount /dev/sda1 /mnt/boot
mount /dev/sda4 /mnt/home
clear && lsblk -f

# mirrorlist
printf "Server = http://archlinux.cs.nctu.edu.tw/\$repo/os/\$arch\n" > /etc/pacman.d/mirrorlist
printf "Server = http://archlinux.ccns.ncku.edu.tw/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist

# install linux
pacstrap /mnt base linux linux-firmware intel-ucode
pacstrap /mnt git dhcpcd sudo pacman

# fstab
genfstab -L /mnt > /mnt/etc/fstab chroot:arch-chroot /mnt
cat /mnt/etc/fstab
blkid
sleep 12 # check swap/boot uuid

# host
printf "127.0.0.1		localhost\n::1			localhost\n127.0.0.1		ouch.localdomain      ouch" >> /mnt/etc/hosts
printf "ouch" > /mnt/etc/hostname

# systemd
claer && lsblk -f
bootctl install --esp-path /mnt/boot
printf "default arch\ntimeout 0" > /mnt/boot/loader/loader.conf
printf "title ouch\nlinux /vmlinuz-linux\ninitrd /initramfs-linux.img\noptions root=/dev/sda3" > /mnt/boot/loader/entries/arch.conf
cat /mnt/boot/loader/entries/arch.conf

###chroot###
cp -r ~/ohmyarch /mnt
arch-chroot /mnt "/ohmyarch/chroot.sh"
###archiso###
cd / && umount -R /mnt && clear
echo "done!"
exec bash
