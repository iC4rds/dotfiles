-- hyprland.lua
-- converted from hyprland.conf
-- ref: https://wiki.hypr.land/configuring/


--###################
--### MY PROGRAMS ###
--###################

-- globals, accessible in binds.lua via dofile
terminal    = "kitty"
fileManager = "nautilus"
menu        = "rofi -show drun -theme catppuccin_mocha.rasi"
browser     = "zen-browser"
lock        = "hyprlock"


--################
--### MONITORS ###
--################

hl.monitor({ output = "eDP-1", mode = "1920x1200@144", position = "0x0", scale = 1.5 })
-- hl.monitor({ output = "DP-5", mode = "2560x1440@144", position = "4480x0", scale = 1 })
-- hl.monitor({ output = "DP-6", mode = "2560x1440@144", position = "1920x0", scale = 1 })


--#################
--### AUTOSTART ###
--#################

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("dunst -conf ~/.config/dunst/dunstrc")
    hl.exec_cmd("copyq --start-server")
    hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "YOUR_DARK_GTK3_THEME"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
end)


--#############################
--### ENVIRONMENT VARIABLES ###
--#############################

hl.env("XCURSOR_SIZE",         "24")
hl.env("HYPRCURSOR_SIZE",      "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")


--################
--### KEYBINDS ###
--################

dofile(os.getenv("HOME") .. "/.config/hypr/binds.lua")


--#####################
--### LOOK AND FEEL ###
--#####################

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,
        border_size = 1,
        ["col.active_border"]   = "rgba(33ccffee) rgba(00ff99ee) 45deg",
        ["col.inactive_border"] = "rgba(595959aa)",
        resize_on_border = false,
        allow_tearing    = false,
        layout = "master",
    },

    decoration = {
        rounding         = 10,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },
        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
        new_on_top  = true,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },

    input = {
        kb_layout  = "de",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad = {
            natural_scroll = true,
            scroll_factor  = 0.4,
        },
    },

    -- 3-finger horizontal swipe to switch workspaces
    gestures = {
        workspace_swipe           = true,
        workspace_swipe_fingers   = 3,
        workspace_swipe_direction = "horizontal",
    },
})

-- per-device mouse sensitivity (check name with: hyprctl devices)
-- hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })


--##################
--### ANIMATIONS ###
--##################

hl.curve("easeOutQuint",   { type = "bezier", points = {{0.23, 1},    {0.32, 1}}   })
hl.curve("easeInOutCubic", { type = "bezier", points = {{0.65, 0.05}, {0.36, 1}}   })
hl.curve("linear",         { type = "bezier", points = {{0, 0},       {1, 1}}      })
hl.curve("almostLinear",   { type = "bezier", points = {{0.5, 0.5},   {0.75, 1.0}} })
hl.curve("quick",          { type = "bezier", points = {{0.15, 0},    {0.1, 1}}    })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   curve = "default"      })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, curve = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, curve = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  curve = "easeOutQuint", style = "popin 87%"  })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 10,   curve = "linear",       style = "slide 87%"  })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, curve = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, curve = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, curve = "quick"        })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, curve = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    curve = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  curve = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, curve = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, curve = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, curve = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, curve = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, curve = "almostLinear", style = "fade" })


--##############################
--### WINDOWS AND WORKSPACES ###
--##############################

hl.window_rule({
    name           = "suppress-maximize",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "xwayland-drag-fix",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
        focus      = true,
    },
})
