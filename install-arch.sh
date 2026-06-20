#!/usr/bin/bash
set -euo pipefail

echo "🔧 Instalando configuración libre de mouse en Arch Linux..."

# Dependencias
sudo pacman -S --noconfirm --needed \
  hyprland kitty neovim yazi imv zathura zathura-pdf-mupdf mpv \
  pamixer playerctl brightnessctl wofi bluetuith ncpamixer \
  autotiling 7zip grim slurp wl-clipboard btop

# Configs
mkdir -p ~/.config/hypr ~/.config/yazi ~/.config/kitty ~/.config/nvim/lua/plugins ~/.local/bin

cp -v config/hypr/hyprland.lua ~/.config/hypr/
cp -v config/yazi/yazi.toml ~/.config/yazi/
cp -v config/kitty/kitty.conf ~/.config/kitty/
cp -rv config/nvim/* ~/.config/nvim/
cp -v config/scripts/audio-switch ~/.local/bin/

# Instalar atajos command
cp -v bin/atajos ~/.local/bin/
chmod +x ~/.local/bin/atajos ~/.local/bin/audio-switch

echo ""
echo "✅ Instalación completada. Recomendado:"
echo "   - Ejecutá 'nvim' para instalar los plugins"
echo "   - Ajustá monitores en ~/.config/hypr/hyprland.lua"
echo "   - Corré 'atajos' para ver todos los shortcuts"
