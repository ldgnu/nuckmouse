# nuckmouse 🖕🐭

Workflow libre de mouse para Hyprland/Linux.

Skills en `.opencode/skills/`:

| Skill | Cuándo se activa |
|---|---|
| **nuckmouse** | Keyboard-only, atajos, Hyprland, TUIs |

## Instalación

```bash
git clone https://github.com/ldgnu/nuckmouse.git
cd nuckmouse
chmod +x install-arch.sh  # o install-fedora.sh / install-ubuntu.sh
./install-arch.sh
```

Después corre `nvim` para que instale los plugins solo, y ajustá monitores en `~/.config/hypr/hyprland.lua`.

## Comandos útiles

```bash
atajos     # ver todos los shortcuts en terminal
audio-switch  # menú wofi para audio
```

## Scripts de instalación

- `install-arch.sh` — Arch Linux (todo en pacman)
- `install-fedora.sh` — Fedora 40+ (yazi desde cargo)
- `install-ubuntu.sh` — Ubuntu 24.04 (Hyprland necesita PPA)
- `install-vps.sh` — Solo terminal tools (nvim, yazi, lazygit, tmux)

## Privacidad

El repo NO incluye:
- Paths personales (Proyectos/, OneDrive/)
- Dispositivos de audio exactos
- Tokens, API keys
- Config DMS (rota)
- Monitores específicos
