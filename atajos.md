# Atajos de Teclado — Adiós Mouse

## 📂 Sistema — Hyprland (Super = tecla Windows)

### Ventanas
| Atajo | Acción |
|-------|--------|
| `Super+Q` | Cerrar ventana |
| `Super+Return` | Abrir terminal (kitty) |
| `Super+E` | Abrir gestor archivos (yazi) |
| `Super+F` | Pantalla completa |
| `Super+V` | Alternar split layout |
| `Super+P` | Pseudo-tile |
| `Super+R` | Modo redimensionar (H/J/K/L) |
| `Super+Shift+Space` | Alternar flotante |

### Navegación
| Atajo | Acción |
|-------|--------|
| `Super+H/J/K/L` | Enfocar izq/abajo/arriba/dcha |
| `Super+Shift+H/J/K/L` | Mover ventana a izq/abajo/arriba/dcha |
| `Super+Ctrl+H/J/K/L` | Redimensionar ventana |
| `Super+1..0` | Ir a workspace 1-10 |
| `Super+Shift+1..0` | Mover ventana a workspace 1-10 |
| `Super+Ctrl+1..0` | Mover y seguir a workspace 1-10 |
| `Alt+1..0` | Ir a workspace 11-20 |
| `Alt+Shift+1..0` | Mover ventana a workspace 11-20 |
| `Alt+Tab` / `Alt+Shift+Tab` | Siguiente/anterior workspace |

### Sistema
| Atajo | Acción |
|-------|--------|
| `Super+Shift+C` | Recargar configuración |
| `Super+Shift+R` | Reiniciar Hyprland |
| `Super+Ctrl+Esc` | Bloquear pantalla |
| `Ctrl+Shift+Esc` | Monitor del sistema (btop) |
| `Super+Shift+A` | Ver todos los atajos (ventana flotante) |

## 🔊 Multimedia

| Tecla | Acción |
|-------|--------|
| `XF86AudioRaiseVolume` | Subir volumen 5% |
| `XF86AudioLowerVolume` | Bajar volumen 5% |
| `XF86AudioMute` | Silenciar/activar |
| `XF86AudioPlay` | Reproducir/pausar |
| `XF86AudioNext` | Siguiente canción |
| `XF86AudioPrev` | Canción anterior |
| `XF86MonBrightnessUp` | Subir brillo 10% |
| `XF86MonBrightnessDown` | Bajar brillo 10% |
| `Super+Z` | Play/pausa |
| `Super+X` | Siguiente canción |

## 🖥️ Terminal (kitty)

| Atajo | Acción |
|-------|--------|
| `Ctrl+Q` | Cerrar ventana |
| `Ctrl+Shift+T` | Nueva pestaña |
| `Ctrl+Shift+Enter` | Nueva ventana |
| `Ctrl+Shift+Right/Left` | Siguiente/anterior pestaña |

## 📁 Yazi (gestor de archivos)

### Navegación
| Tecla | Acción |
|-------|--------|
| `j`/`k` | Abajo/arriba |
| `h`/`l` | Salir/entrar directorio |
| `g`+`g` / `G` | Ir al inicio/final |
| `/` | Buscar archivos |
| `q` | Salir |

### Archivos
| Tecla | Acción |
|-------|--------|
| `y` | Copiar |
| `p` | Pegar |
| `d` | Cortar |
| `D` | Eliminar |
| `a` | Renombrar |
| `c` | Crear archivo |
| `w` | Crear directorio |
| `.` | Mostrar ocultos |
| `Space` | Seleccionar |
| `Tab` | Alternar paneles |
| `~` | Ir al home |
| `-` | Ir a directorio anterior |

### Apertura
| Tipo | App |
|------|-----|
| Imágenes | imv |
| PDF | zathura |
| Videos/audio | mpv |
| Texto/código/CSV | nvim |
| Comprimidos | 7z (extrae) |

## ✍️ Neovim

| Atajo | Acción |
|-------|--------|
| `Space+ff` | Buscar archivos (Telescope) |
| `Space+fg` | Buscar texto (grep) |
| `Space+fb` | Lista de buffers |
| `Space+fh` | Buscar ayuda |
| `Space+w` | Guardar |
| `Space+q` | Cerrar |
| `Space+x` | Buscar en archivos (Oil) |
| `K` | Mostrar documentación (hover) |
| `gd` | Ir a definición |
| `gr` | Ir a referencias |
| `gi` | Ir a implementación |
| `Space+rn` | Renombrar |
| `Space+ca` | Code actions |
| `Space+fm` | Formatear código |
| `Space+xx` | Mostrar errores (Trouble) |
| `[d` / `]d` | Error anterior/siguiente |
| `Tab` | Completar autocompletado |
| `Ctrl+Space` | Forzar autocompletado |

## 🌐 Zen Browser / Vimium

| Tecla | Acción |
|-------|--------|
| `j`/`k` | Scroll abajo/arriba |
| `d`/`u` | Media página abajo/arriba |
| `gg`/`G` | Ir al inicio/fin |
| `t` | Nueva pestaña |
| `x` | Cerrar pestaña |
| `X` | Reabrir pestaña |
| `J`/`K` | Pestaña anterior/siguiente |
| `H`/`L` | Atrás/adelante |
| `f` | Link hints |
| `/` | Buscar en página |
| `n`/`N` | Siguiente/anterior resultado |
| `o`/`O` | Abrir URL o bookmark |
| `yy` | Copiar URL |
| `?` | Ver todos los atajos de Vimium |

## 🔊 ncpamixer (control de audio)

| Tecla | Acción |
|-------|--------|
| `Tab` | Cambiar sección |
| `↑↓` | Seleccionar dispositivo |
| `+/-` | Subir/bajar volumen |
| `m` | Mute |
| `q` / `Esc` | Salir |

## 🔵 Bluetuith (Bluetooth)

| Tecla | Acción |
|-------|--------|
| `↑↓` | Navegar dispositivos |
| `Enter` | Conectar |
| `Ctrl+D` | Desconectar |
| `q` / `Esc` | Salir |

## 📡 nmtui (redes WiFi)

| Tecla | Acción |
|-------|--------|
| `↑↓` | Navegar |
| `Enter` | Seleccionar |
| `Tab` | Cambiar sección |
| `Esc` | Salir/atrás |

## 💻 Comandos de terminal

### Audio
```bash
pamixer -i 5       # subir 5%
pamixer -d 5       # bajar 5%
pamixer -t         # mute toggle
pamixer --get-volume
pamixer --set-volume 70

playerctl play-pause
playerctl next
playerctl previous
```

### Bluetooth
```bash
bluetoothctl connect 00:AA:BB:CC:DD:EE
bluetoothctl disconnect 00:AA:BB:CC:DD:EE
```

### Brillo
```bash
brightnessctl s +10%
brightnessctl s 10%-
```

### Red
```bash
nmtui
nmcli device wifi list
nmcli device wifi connect "SSID" password "contraseña"
```
