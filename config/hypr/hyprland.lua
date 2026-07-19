--[[
▗▄▄▖ ▗▖ ▗▖ ▗▄▄▖ ▗▄▄▖▗▄▄▖▗▖  ▗▖▗▖    ▗▄▖ ▗▖  ▗▖▗▄▄▄
▐▌ ▐▌▐▌ ▐▌▐▌   ▐▌   ▐▌ ▐▌▝▚▞▘ ▐▌   ▐▌ ▐▌▐▛▚▖▐▌▐▌  █
▐▛▀▘ ▐▌ ▐▌▐▌▝▜▌ ▝▀▚▖▐▛▀▚▖ ▐▌  ▐▌   ▐▛▀▜▌▐▌ ▝▜▌▐▌  █
▐▌   ▝▚▄▞▘▝▚▄▞▘▗▄▄▞▘▐▙▄▞▘ ▐▌  ▐▙▄▄▖▐▌ ▐▌▐▌  ▐▌▐▙▄▄▀
Pugsby's hyprland dotfiles'
]]

require("keybinds")
require("apps")
require("lookandfeel")
require("monitors")

-- Cursor
hl.env("XCURSOR_SIZE", "30")
hl.env("XCURSOR_THEME", "Bibata-Original-Classic")

-- Layout
hl.config({
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    scrolling = {
        fullscreen_on_one_column = true,
    },
    misc = {
        force_default_wallpaper = 1,
        disable_hyprland_logo   = false,
    },
})

-- Workspaces
local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
