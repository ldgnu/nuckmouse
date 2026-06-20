# nuckmouse 🖕🐭

**no + fuck + mouse = nuckmouse**

No me anda el mouse, asi que arme este setup para vivir solo con el teclado. Hyprland, kitty, neovim, yazi y un monton de TUIs.

Funciona en **Arch**, **Fedora 40+** y **Ubuntu 24.04**. Tambien hay un script para **VPS** si solo queres las tools de terminal sin GUI.

## Que incluye

| Que | Para |
|-----|------|
| **Hyprland** | Window manager, todo con teclas |
| **kitty** | Terminal, sin mouse needed |
| **yazi** | File manager TUI re piola |
| **neovim** | Editor con plugins, LSP, autocomplete |
| **ncpamixer** | Control de audio como pavucontrol pero en terminal |
| **bluetuith** | Bluetooth desde terminal |
| **nmtui** | Redes WiFi |
| **playerctl** | Multimedia (play, next, prev) |
| **pamixer** | Volumen |
| **wofi** | Menu lindo para seleccionar cosas |

## Quick install

### Arch
```bash
git clone https://github.com/ldgnu/nuckmouse.git
cd nuckmouse
chmod +x install-arch.sh
./install-arch.sh
```

### Fedora 40+
```bash
git clone https://github.com/ldgnu/nuckmouse.git
cd nuckmouse
chmod +x install-fedora.sh
./install-fedora.sh
```

### Ubuntu 24.04
```bash
git clone https://github.com/ldgnu/nuckmouse.git
cd nuckmouse
chmod +x install-ubuntu.sh
./install-ubuntu.sh
```

### VPS (solo terminal, sin GUI)
```bash
git clone https://github.com/ldgnu/nuckmouse.git
cd nuckmouse
chmod +x install-vps.sh
./install-vps.sh
```

## Despues de instalar

1. Ajusta tus monitores en `~/.config/hypr/hyprland.lua`
2. Abri `nvim` asi instala los plugins solo
3. Agrega `~/.local/bin` (y `~/.cargo/bin` si usaste cargo) a tu PATH
4. Corre `atajos` para ver todos los shortcuts

## Shortcuts

Tire `atajos` en la terminal y te aparece todo. O mira el [atajos.md](atajos.md).

**Los mas importantes:**
- `Super+Return` → terminal
- `Super+E` → yazi (archivos)
- `Super+Q` → cerrar ventana
- `Super+B` → bluetooth
- `Super+U` → audio
- `Super+H/J/K/L` → moverse entre ventanas
- `Super+Shift+N` → redes WiFi
- `Super+Z` → play/pausa
- `Super+X` → next track
- `Super+1..0` → workspaces

## Keys de hardware (media keys)

Las teclas de volumen, play, brillo del teclado andan directo.

## Personalizar

Toda la config esta en `~/.config/`:
- `hypr/hyprland.lua` — hyprland
- `kitty/kitty.conf` — terminal
- `nvim/` — neovim
- `yazi/yazi.toml` — file manager
- `local/bin/audio-switch` — script de audio con wofi

## Cosas que no estan aca (por privacidad)

Saque lo personal:
- Tus paths de proyectos
- Tus dispositivos de audio exactos (hardware IDs)
- Tokens, API keys, passwords
- Integraciones con OneDrive, etc.

Los scripts tienen placeholders, editalos a tu gusto.

## Cheatsheet rapida

### Audio
```bash
pamixer -i 5        # subir
pamixer -d 5        # bajar
pamixer -t          # mute
playerctl play-pause
playerctl next
```

### Bluetooth
```bash
bluetoothctl connect MAC     # conectar
bluetoothctl disconnect MAC  # desconectar
```

### Red
```bash
nmtui                        # menu interactivo
nmcli device wifi list       # ver redes
nmcli device wifi connect SSID password CLAVE
```

## Notas por distro

| Paquete | Arch | Fedora | Ubuntu |
|---------|------|--------|--------|
| Hyprland | pacman | dnf | manual/PPA |
| yazi | pacman | cargo | cargo |
| bluetuith | pacman | manual | manual |
| ncpamixer | pacman | manual | manual |
| autotiling | pacman | pip | pip |

## Por que nuckmouse?

Porque el mouse no funciona y estoy podrido de depender de ese device inutil. Teclado master race.
