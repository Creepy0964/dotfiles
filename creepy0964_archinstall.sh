#!/bin/bash
clear

if [ "$EUID" -ne 0 ]; then
    echo -e 'Do NOT execute this script as default user.'
    exit
fi

echo -e "Welcome to Creepy0964's Arch Linux Installation Script. This file is supposed to automate some routine work after fresh Arch Linux install."
echo -e "WARNING: This script is supposed to install grub at /dev/sdX1. If you are using another disk, e.g. /dev/nvmeXnXpX, please DO NOT EXECUTE this script. Press [y/N] based on your desire to continue."

read -s -n 1 key

case $key in
    y)
        echo "You pressed 'y'. Continuing..."
        ;;
    N)
        echo "You pressed 'N'. Exiting..."
        exit 1
        ;;
    *)
        echo "Invalid input. Exiting..."
        exit 1
        ;;
esac

pacman -S dhcpcd git nano neofetch alacritty i3-wm picom polybar feh rofi xorg lightdm lightdm-gtk-greeter nodejs npm grub efibootmgr os-prober --needed --noconfirm

while pgrep -x pacman > /dev/null; do sleep 1; done

echo "creepy-arch" > /etc/hostname
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo -e "en_US.UTF-8\nru_RU.UTF-8" > /etc/locale.gen
locale-gen

passwd

disk=$(df | grep '/dev/sd' | sed -n '$s/[[:blank:]].*//p')
efi_disk=$(df | grep '/dev/sd' | sed -n '$s/[[:blank:]].*//p' | sed 's/[0-9]//g')
efi_disk="${efi_disk}1"

mount $efi_disk /mnt
grub-install $disk --target=x86_64-efi --efi-directory=/mnt/boot
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd
systemctl enable lightdm

useradd -m -g users -G wheel -s /bin/bash creepy0964
passwd creepy0964

echo -e 'All done! Now reboot and freely use Arch Linux.'