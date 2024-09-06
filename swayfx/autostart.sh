#!/bin/bash

# Function to start a process with a delay
start_with_delay() {
    local delay=$1
    shift
    sleep "$delay" && exec "$@" &
}

# Start sunshine with a 10-second delay
start_with_delay 10 sunshine stream

# Start swww-random command
# exec ~/.config/sway/swww-random.sh &

# Start mako
exec mako &

# Start Mullvad-VPN with a 10-second delay
start_with_delay 10 mullvad-vpn %U --ozone-platform=wayland --enable-features=WaylandWindowDecorations

# Start CKB with a 10-second delay (uncomment if needed)
# start_with_delay 10 ckb-next

# Start veik driver

# Polkit
# exec "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" &
exec /usr/bin/lxpolkit &


# Python for window gapping
exec python ./scripts/dynamic_gaps.py &

# Start Syncthingtray
exec /home/squid/scripts/syncthingtray-late-start.sh &

# Start journal -f
exec foot -a journalctl-f journalctl -f &

start_with_delay 10 udiskie &

start_with_delay 10 QT_QPA_PLATFORM=xcb /usr/lib/vktablet/vktablet &

start_with_delay 10 copyq &

Start_with_delay 10 keepassxc &

exec sh ~/scripts/random-waypaper.sh &

exec ~/scripts/transparent-inactive.py
