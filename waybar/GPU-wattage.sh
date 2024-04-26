#!/bin/bash
    # Read the raw GPU wattage value (in mW) from the monitoring source
    gpu_wattage_mW=$(< /dev/gpu_power)
    
    # Convert the raw wattage value to watts or kilowatts
    if [ $gpu_wattage_mW -ge 1000 ]; then
        # Convert to kilowatts (kW) if the value is large
        gpu_wattage=$(awk "BEGIN {printf \"%.2f\", $gpu_wattage_mW / 1000000}")
        echo "$gpu_wattage"
    else
        # Display in watts (W) if the value is small
        gpu_wattage=$((gpu_wattage_mW))
        echo "$gpu_wattage"
    fi
