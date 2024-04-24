#!/bin/sh

while true; do

  battery_info=$(acpi -b | tail -n 1 | tr -d ',%')
  battery_percent=$(echo $battery_info | awk '{print $4}')
  battery_status=$(echo $battery_info | awk '{print $3}')

  if [ $battery_status = "Discharging" ]; then
      if [ $battery_percent -le 10 ]; then
          notify-send "󱃍 Battery low" "Battery level is ${battery_percent}%!"
      fi
  fi

  sleep 60

done
