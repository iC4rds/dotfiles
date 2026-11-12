-- binds.lua
-- loaded via dofile() from hyprland.lua
-- terminal/fileManager/menu/browser/lock are globals from hyprland.lua

local mainMod = "SUPER"

-- general
hl.bind(mainMod .. " + RETURN",    hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",         hl.dsp.window.close())
hl.bind(mainMod .. " + M",         hl.dsp.exit())
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B",         hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + V",         hl.dsp.window.float())
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.resize({ x = 680, y = 370 }))
hl.bind(mainMod .. " + SPACE",     hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R",         hl.dsp.exec_cmd("~/.config/rofi/mainmenu.sh"))
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo())
hl.bind(mainMod .. " + N",         hl.dsp.layout("orientationnext"))
hl.bind(mainMod .. " + L",         hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("~/.config/waybar/waybar.sh"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("~/.config/dunst/dunst.sh"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/hyprpaper.sh"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd("~/.config/hypr/scripts/hypridle.sh"))

-- screenshots (hyprshot)
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT",                hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("SHIFT + PRINT",        hl.dsp.exec_cmd("hyprshot -m region"))

-- wallpaper
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/wall.sh"))

-- focus (directional)
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down"  }))

-- switch workspace
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))

-- move window to workspace
for i = 1, 9 do
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- special workspace (scratchpad)
hl.bind(mainMod .. " + S",          hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S",  hl.dsp.window.move({ workspace = "special:magic" }))

-- scroll through workspaces with mouse wheel
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- move/resize windows with mouse drag (mouse flag = driven by cursor movement)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- volume (repeating while held)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/louder.sh"),            { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/quiter.sh"),            { repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("~/.config/hypr/scripts/mute.sh"),              { repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true })

-- brightness (repeating while held)
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("~/.config/hypr/scripts/brighter.sh"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/darker.sh"),   { repeating = true })

-- media keys (locked = work on lockscreen)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- power button: suspend
hl.bind("XF86poweroff", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })
