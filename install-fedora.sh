#!/usr/bin/bash
set -euo pipefail

echo "🔧 Instalando nuckmouse en Fedora 40+..."

# Dependencias disponibles en repos oficiales
sudo dnf install -y \
  hyprland kitty neovim imv zathura zathura-pdf-mupdf mpv \
  pamixer playerctl brightnessctl \
  wofi grim slurp wl-clipboard btop \
  p7zip p7zip-plugins \
  NetworkManager-tui \
  cargo rustc python3-pip

# yazi (no esta en repos de Fedora, va con cargo)
if ! command -v yazi &>/dev/null; then
  echo "Instalando yazi desde cargo..."
  cargo install --locked yazi-fm
  echo "Agrega ~/.cargo/bin a tu PATH"
fi

# autotiling
if ! command -v autotiling &>/dev/null; then
  pip3 install --user autotiling
fi

# bluetuith y ncpamixer no estan en Fedora.
# Opcionales:
#   bluetuith: https://github.com/darkhz/bluetuith (go install)
#   ncpamixer: https://github.com/nickclyde/ncpamixer

# ncpamixer alternativa: pulsemixer
sudo dnf install -y pulsemixer || true

# Configs
mkdir -p ~/.config/hypr ~/.config/yazi ~/.config/kitty ~/.config/nvim/lua/plugins ~/.local/bin ~/.local/share/nuckmouse

cp -v config/hypr/hyprland.lua ~/.config/hypr/
cp -v config/yazi/yazi.toml ~/.config/yazi/
cp -v config/kitty/kitty.conf ~/.config/kitty/
cp -rv config/nvim/* ~/.config/nvim/
cp -v config/scripts/audio-switch ~/.local/bin/
cp -v bin/atajos ~/.local/bin/
cp -v atajos.md ~/.local/share/nuckmouse/
chmod +x ~/.local/bin/atajos ~/.local/bin/audio-switch

echo ""
echo "✅ Listo. Recorda:"
echo "   - 'nvim' para instalar plugins"
echo "   - Ajusta monitores en ~/.config/hypr/hyprland.lua"
echo "   - Agrega ~/.local/bin y ~/.cargo/bin a tu PATH"
echo "   - 'atajos' para ver shortcuts"
