#! /bin/bash
# DWL自启动脚本 仅作参考

systemctl --user unmask xdg-desktop-portal-hyprland
systemctl --user mask xdg-desktop-portal-gnome

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
/usr/libexec/xdg-desktop-portal-hyprland &
wlsunset -T 3501 -t 3500 &
swaybg -i $DWL/wallpaper/caoyuan.jpg & # 壁纸
waybar -c $DWL/waybar/config -s $DWL/waybar/style.css &
echo "Xft.dpi: 140" | xrdb -merge #dpi缩放
cp ~/.local/share/wayland/konsole -r ~/.local/share/
cp ~/.config/fcitx/dwm_profile ~/.config/fcitx/profile -f
# 开启输入法
fcitx &
systemctl --user mask xdg-desktop-portal-gnome
systemctl --user mask xdg-desktop-portal-hyprland
# /usr/libexec/xdg-desktop-portal &

mako & # 开启通知server
wl-clip-persist --clipboard regular &
wl-paste -t text --watch clipman store --no-persist &
blueman-applet &
nm-applet &
/usr/local/libexec/polkit-gnome-authentication-agent-1 &
# numlockx on
[ -e /dev/sda1 ] && udisksctl mount -b /dev/sda4
python3 ~/tool/sign.py &
eww daemon &
