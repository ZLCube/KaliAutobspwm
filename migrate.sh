#!/bin/bash

set -e

if [ "$(whoami)" == "root" ]; then
    echo "[!] No ejecutes este script como root"
    exit 1
fi

ruta=$(pwd)
user=$(whoami)
backup="$HOME/.backup-autobspwm-$(date +%Y%m%d-%H%M%S)"

echo "[*] Creando backup en $backup"
mkdir -p "$backup"

for dir in bspwm bin picom polybar rofi kitty eww starship cava sxhkd; do
    [ -d "$HOME/.config/$dir" ] && cp -r "$HOME/.config/$dir" "$backup/"
done

[ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$backup/.zshrc"
[ -f "$HOME/.p10k.zsh" ] && cp "$HOME/.p10k.zsh" "$backup/.p10k.zsh"

sudo mkdir -p "$backup/root"
sudo cp /root/.zshrc "$backup/root/.zshrc" 2>/dev/null || true
sudo cp /root/.p10k.zsh "$backup/root/.p10k.zsh" 2>/dev/null || true

echo "[*] Instalando dependencias nuevas mínimas"
sudo apt update
sudo apt install -y \
    zsh kitty polybar picom rofi feh dunst jq playerctl brightnessctl \
    cava bat lsd fzf ranger maim imagemagick acpi network-manager \
    network-manager-tui curl fonts-font-awesome

echo "[*] Instalando Starship si no existe"

curl -sS https://starship.rs/install.sh | sh 


echo "[*] Limpiando dots viejos"
sudo rm -rf \
    "$HOME/.p10k.zsh" \
    "$HOME/.config/bspwm" \
    "$HOME/.config/bin" \
    "$HOME/.config/picom" \
    "$HOME/.config/polybar" \
    "$HOME/.config/rofi" \
    "$HOME/.config/kitty" \
    "$HOME/.config/eww" \
    "$HOME/.config/starship" \
    "$HOME/.config/cava"

sudo rm -f /root/.p10k.zsh

echo "[*] Copiando dots nuevos"
mkdir -p "$HOME/.config"

cp -rv "$ruta/config/bspwm" "$HOME/.config/"
cp -rv "$ruta/config/bin" "$HOME/.config/"
cp -rv "$ruta/config/picom" "$HOME/.config/"
cp -rv "$ruta/config/polybar" "$HOME/.config/"
cp -rv "$ruta/config/rofi" "$HOME/.config/"
cp -rv "$ruta/config/kitty" "$HOME/.config/"
cp -rv "$ruta/config/eww" "$HOME/.config/"
cp -rv "$ruta/config/starship" "$HOME/.config/"
cp -rv "$ruta/config/cava" "$HOME/.config/"

[ -d "$ruta/config/sxhkd" ] && cp -rv "$ruta/config/sxhkd" "$HOME/.config/"

echo "[*] Copiando wallpapers/local/fonts"
[ -d "$ruta/wallpapers" ] && cp -rv "$ruta/wallpapers" "$HOME/"
[ -d "$ruta/local" ] && cp -rv "$ruta/local/"* "$HOME/.local/"

if [ -d "$ruta/fonts" ]; then
    sudo cp -rv "$ruta/fonts/"* /usr/local/share/fonts/
    fc-cache -fv
fi

echo "[*] Copiando ZSH usuario/root"
cp -v "$ruta/zshrc" "$HOME/.zshrc"

sudo mkdir -p /root/.config
sudo cp -v "$ruta/root/zshrc" /root/.zshrc
sudo rm -rf /root/.config/starship
sudo cp -rv "$ruta/root/starship" /root/.config/

if [ -f "$ruta/root/sudo.plugin.zsh" ]; then
    sudo mkdir -p /usr/share/zsh-sudo
    sudo cp -v "$ruta/root/sudo.plugin.zsh" /usr/share/zsh-sudo/sudo.plugin.zsh
fi

echo "[*] Instalando EWW binario si viene en el repo"
if [ -f "$ruta/eww" ]; then
    sudo cp "$ruta/eww" /usr/local/bin/eww
elif [ -f "$ruta/config/eww/eww" ]; then
    sudo cp "$ruta/config/eww/eww" /usr/local/bin/eww
elif [ -f "$ruta/bin/eww" ]; then
    sudo cp "$ruta/bin/eww" /usr/local/bin/eww
fi

sudo chmod +x /usr/local/bin/eww 2>/dev/null || true

echo "[*] Aplicando permisos"
chmod +x "$HOME/.config/bspwm/bspwmrc" 2>/dev/null || true
chmod +x "$HOME/.config/bspwm/scripts/"* 2>/dev/null || true
chmod +x "$HOME/.config/bin/"* 2>/dev/null || true
chmod +x "$HOME/.config/polybar/launch.sh" 2>/dev/null || true
sudo chown -R "$user:$user" "$HOME/.config"

sudo chown root:root /usr/local/share/zsh/site-functions/_bspc 2>/dev/null || true

echo "[✓] Migración completada"
echo "[i] Backup: $backup"
echo "[i] Cierra sesión y vuelve a entrar a BSPWM"
