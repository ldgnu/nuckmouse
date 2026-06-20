#!/usr/bin/bash
set -euo pipefail

echo "🔧 Instalando herramientas para VPS (solo terminal)..."

sudo apt update
sudo apt install -y \
  neovim tmux fzf ripgrep fd-find btop htop \
  git curl wget unzip zsh \
  build-essential

# lazygit
if ! command -v lazygit &>/dev/null; then
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
  rm lazygit lazygit.tar.gz
fi

# yazi — depende de Rust
if ! command -v yazi &>/dev/null; then
  sudo apt install -y cargo rustc
  cargo install --locked yazi-fm
fi

# Configs
mkdir -p ~/.config/nvim/lua/plugins ~/.config/yazi
cp -rv config/nvim/* ~/.config/nvim/
cp -v config/yazi/yazi.toml ~/.config/yazi/

echo ""
echo "✅ VPS listo. Recomendado:"
echo "   - 'nvim' para instalar plugins"
echo "   - 'tmux' como multiplexor de terminal"
echo "   - 'lazygit' para git sin mouse"
echo "   - 'atajos' para ver shortcuts"
