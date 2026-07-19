hl.bind("SUPER + Return", hl.dsp.exec_cmd("kitty"))
hl.bind("CTRL+ALT+t", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + F11", hl.dsp.window.float({ action = "toggle" }))
-- Windows-inspired keybinds
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nemo"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind("SUPER + " .."SUPER_L", hl.dsp.exec_cmd("fuzzel"))

hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

-- Fn F keys
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("amixer sset 'Master' playback 10%-"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("amixer sset 'Master' playback 10%+"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))


-- Workspace Stuff
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

--Input goes here too

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
