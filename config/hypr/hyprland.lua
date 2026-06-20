-- hyprland.lua — Configuración Hyprland libre de mouse
-- ============================================================

local terminal    = "kitty"
local fileManager = "kitty --title yazi yazi"
local browser     = "zen-browser"

-- ========================================
-- ENVIRONMENT
-- ========================================
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland")

-- ========================================
-- MONITORS — adjust to your setup
-- ========================================
-- hl.monitor({ output = "eDP-1",  mode = "1920x1080@60", position = "0x0", scale = "1" })
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "1920x0", scale = "1", transform = 1 })

-- ========================================
-- WORKSPACE TO MONITOR BINDINGS
-- ========================================
-- for i = 1, 4 do hl.workspace_rule({ workspace = tostring(i), monitor = "eDP-1" }) end

-- ========================================
-- INPUT
-- ========================================
hl.config({
  input = {
    kb_layout    = "latam",
    kb_variant   = "deadtilde",
    kb_model     = "pc105",
    kb_options   = "terminate:ctrl_alt_bksp",
    repeat_rate  = 30,
    repeat_delay = 300,
    follow_mouse = 0,
    touchpad = { natural_scroll = false },
  },
})

-- ========================================
-- LOOK AND FEEL
-- ========================================
hl.config({
  general = {
    gaps_in     = 4,
    gaps_out    = 6,
    border_size = 2,
    col = {
      active_border   = { colors = {"rgb(cba6f7)", "rgb(89b4fa)", "rgb(b4befe)", "rgb(f5c2e7)"}, angle = 45 },
      inactive_border = "rgb(585b70)",
    },
    resize_on_border = false,
    allow_tearing    = false,
    layout           = "dwindle",
  },
  decoration = {
    rounding       = 10,
    rounding_power = 2,
    active_opacity   = 1.0,
    inactive_opacity = 0.92,
    shadow = { enabled = true, range = 12, render_power = 3, color = 0xee1a1a1a },
    blur = {
      enabled = true, size = 4, passes = 2, new_optimizations = true,
      ignore_opacity = true, vibrancy = 0.2, popups = true, popups_ignorealpha = 0.2,
    },
  },
  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo   = false,
    disable_autoreload      = false,
    focus_on_activate       = false,
    enable_swallow          = false,
  },
})

-- ========================================
-- ANIMATIONS
-- ========================================
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 8,    spring = "easy" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- ========================================
-- LAYOUT
-- ========================================
hl.config({ dwindle = { preserve_split = true } })
hl.config({ master  = { new_status = "master" } })

-- ========================================
-- AUTOSTART
-- ========================================
hl.on("hyprland.start", function()
  hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland")
  hl.exec_cmd("autotiling")
  hl.exec_cmd("/usr/lib/polkit-1/polkit-agent-helper-1")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY DBUS_SESSION_BUS_ADDRESS")
end)

-- ========================================
-- KEYBINDINGS
-- ========================================
local M = "SUPER"

-- Apps
hl.bind(M .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(M .. " + Q",      hl.dsp.window.close())
hl.bind(M .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(M .. " + B",      hl.dsp.exec_cmd("kitty --title bluetuith bluetuith"))
hl.bind(M .. " + U",      hl.dsp.exec_cmd("kitty --title ncpamixer ncpamixer"))

-- Navigation (vim-style)
hl.bind(M .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(M .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(M .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(M .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(M .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(M .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(M .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(M .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(M .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(M .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(M .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(M .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

hl.bind(M .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(M .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(M .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(M .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- Resize
hl.bind(M .. " + CTRL + H",     hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(M .. " + CTRL + J",     hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind(M .. " + CTRL + K",     hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(M .. " + CTRL + L",     hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(M .. " + CTRL + left",  hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(M .. " + CTRL + down",  hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind(M .. " + CTRL + up",    hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(M .. " + CTRL + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })

-- Layout
hl.bind(M .. " + F", hl.dsp.window.fullscreen())
hl.bind(M .. " + V", hl.dsp.layout("togglesplit"))
hl.bind(M .. " + P", hl.dsp.window.pseudo())

-- Special workspace (scratchpad)
hl.bind(M .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(M .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Floating toggle
hl.bind(M .. " + SHIFT + space", hl.dsp.window.float({ action = "toggle" }))

-- Focus monitor
hl.bind(M .. " + A",       hl.dsp.focus({ monitor = "left" }))
hl.bind(M .. " + SHIFT + A", hl.dsp.exec_cmd("kitty --title atajos -e less -R $HOME/.local/share/nuckmouse/atajos.md"))

-- System
hl.bind(M .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(M .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(M .. " + CONTROL + Escape", hl.dsp.exec_cmd("hyprlock"))
hl.bind(M .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(terminal .. " -e btop"))
hl.bind(M .. " + slash", hl.dsp.exec_cmd("kitty --title atajos -e less -R $HOME/.local/share/nuckmouse/atajos.md"))

-- Workspaces 1-10
for i = 1, 9 do
  hl.bind(M .. " + " .. i,           hl.dsp.focus({ workspace = i }))
  hl.bind(M .. " + SHIFT + " .. i,   hl.dsp.window.move({ workspace = i }))
  hl.bind(M .. " + CTRL + " .. i,    hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace " .. i .. "; hyprctl dispatch workspace " .. i))
end
hl.bind(M .. " + 0",         hl.dsp.focus({ workspace = 10 }))
hl.bind(M .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind(M .. " + CTRL + 0",  hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace 10; hyprctl dispatch workspace 10"))

-- Workspaces 11-20 (Alt)
for i = 11, 20 do
  local key = i % 10
  hl.bind("ALT + " .. key,           hl.dsp.focus({ workspace = i }))
  hl.bind("ALT + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
  hl.bind("ALT + CTRL + " .. key,    hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace " .. i .. "; hyprctl dispatch workspace " .. i))
end

hl.bind("ALT + Tab",          hl.dsp.focus({ workspace = "e+1" }))
hl.bind("ALT + SHIFT + Tab",  hl.dsp.focus({ workspace = "e-1" }))

-- Mouse (for when you absolutely need it)
hl.bind(M .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(M .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ========================================
-- MULTIMEDIA
-- ========================================
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"),              { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"),              { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pamixer -t"),                { locked = true })
hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl play-pause"),      { locked = true })
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("playerctl next"),            { locked = true })
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("playerctl previous"),        { locked = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl s +10%"),      { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl s 10%-"),      { locked = true, repeating = true })

hl.bind(M .. " + Z", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(M .. " + X", hl.dsp.exec_cmd("playerctl next"))

-- ========================================
-- AUDIO DEVICES (change to your hardware)
-- ========================================
-- hl.bind("ALT + O", hl.dsp.exec_cmd("pactl set-default-sink <your-headset> ; notify-send 'Headset'"))
-- hl.bind("ALT + SHIFT + O", hl.dsp.exec_cmd("pactl set-default-sink <your-speakers> ; notify-send 'Speakers'"))

-- ========================================
-- UTILITIES
-- ========================================
hl.bind("ALT + C", hl.dsp.exec_cmd("gsimplecal"))

-- ========================================
-- RESIZE MODE
-- ========================================
hl.bind(M .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
  hl.bind("H",       hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
  hl.bind("J",       hl.dsp.window.resize({ x = 0, y = 10, relative = true }))
  hl.bind("K",       hl.dsp.window.resize({ x = 0, y = -10, relative = true }))
  hl.bind("L",       hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
  hl.bind("left",    hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
  hl.bind("down",    hl.dsp.window.resize({ x = 0, y = 10, relative = true }))
  hl.bind("up",      hl.dsp.window.resize({ x = 0, y = -10, relative = true }))
  hl.bind("right",   hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
  hl.bind("Return",  hl.dsp.submap("reset"))
  hl.bind("Escape",  hl.dsp.submap("reset"))
end)

-- ========================================
-- WINDOW RULES — FLOATING
-- ========================================
hl.window_rule({ name = "yazi-tui",      match = { title = "yazi" },      float = true, size = "900 700" })
hl.window_rule({ name = "bluetuith-tui", match = { title = "bluetuith" }, float = true, size = "800 600" })
hl.window_rule({ name = "ncpamixer-tui", match = { title = "ncpamixer" }, float = true, size = "800 600" })
hl.window_rule({ name = "atajos-tui",    match = { title = "atajos" },    float = true, size = "900 700" })
