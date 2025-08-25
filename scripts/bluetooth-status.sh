#!/bin/bash

# Check if Bluetooth is powered on
powered=$(bluetoothctl show | grep "Powered: yes")

if [ -z "$powered" ]; then
    echo "Off"
    exit
fi

# Get connected device name
device_info=$(bluetoothctl info)
if [[ -z "$device_info" ]]; then
    echo "On"
else
    name=$(echo "$device_info" | grep "Name:" | sed 's/.*Name: //')
    echo "$name"
fi
