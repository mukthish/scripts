#!/bin/bash

sudo sed -i 's/^UPDATEDEFAULT=.*/UPDATEDEFAULT=no/' /etc/sysconfig/kernel
sudo sed -i 's/^GRUB_DEFAULT=.*/GRUB_DEFAULT=saved/' /etc/default/grub
sudo grub2-set-default "$(sudo awk -F\' '$1=="menuentry " && $2 ~ /Windows Boot Manager/ {print $2}' /boot/grub2/grub.cfg | head -n 1)"
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
