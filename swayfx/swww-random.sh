#!/bin/bash

swww-daemon &

MAX_INSTANCES=2
num_instances=$(pgrep -cx "swww-random.sh")

if [ "$num_instances" -ge "$MAX_INSTANCES" ]; then
    pids=$(pgrep -o "swww-random.sh")
    pkill -x "swww-random.sh"
    kill -CONT $pids
else
    while true; do
        swww img --transition-duration 10 "$(find ~/Pictures/BG/ -type f | shuf -n 1)"
        rm -fr ~/.cache/swww
        sleep 60
    done
fi
