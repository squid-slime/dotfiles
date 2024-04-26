#!/bin/bash

cpu_freq=$(cpupower frequency-info | tac | grep "current CPU frequency" | awk '{print $4}')
echo "$cpu_freq"
