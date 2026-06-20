#!/usr/bin/bash
set -euo pipefail

echo "🔧 Instalando configuración libre de mouse en Ubuntu 24.04..."

# Dependencias
sudo apt update
sudo apt install -y \
  kitty neovim zathura mpv pamixer playerctl brightnessctl \
  wofi grim slurp wl-clipboard btop p7zip-full \
  network-manager

# Compilar e instalar hyprland desde source o PPA
if ! command -v hyprctl &>/dev/null; then
  echo "Instalando Hyprland..."
  sudo apt install -y hyprland || {
    echo "Hyprland no disponible en repos. Instalá desde https://hyprland.org"
    echo "O usá: https://github.com/hyprwm/Hyprland/wiki/Installation"
  }
fi

# yazi
if ! command -v yazi &>/dev/null; then
  echo "Instalando yazi..."
  sudo apt install -y cargo rustc
  cargo install --locked yazi-fm
fi

# imv
if ! command -v imv &>/dev/null; then
  sudo apt install -y imv || {
    echo "imv no disponible, usá: sudo add-apt-repository ppa:savoury1/backports && sudo apt update && sudo apt install imv"
  }
fi

# zathura-pdf-mupdf
sudo apt install -y zathura-pdf-mupdf || sudo apt install -y zathura-pdf-poppler

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
echo "   - Agregá ~/.local/bin a tu PATH si no está"
echo "   - Corré 'atajos' para ver todos los shortcuts"
