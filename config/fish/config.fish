set fish_greeting
if uwsm check may-start; then
    exec uwsm start hyprland.desktop
end  
starship init fish | source