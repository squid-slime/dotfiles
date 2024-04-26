#!/bin/bash

swww-daemon &

MAX_INSTANCES=2
num_instances=$(pgrep -cx "swww-random.sh")
if [ "$num_instances" -ge "$MAX_INSTANCES" ]; then    
	echo "Maximum number of instances reached. Exiting..."
    exit
else
    # If sww-random.sh is not running then continue
    while true; do
        swww img --transition-duration 10 "$(find ~/Pictures/BG/ -type f | shuf -n 1)"
        sleep 60
    done
fi
