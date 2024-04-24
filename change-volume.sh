#!/bin/sh

if [ "$1" = "up" ]; then
  pamixer --increase 5
elif [ "$1" = "down" ]; then
  pamixer --decrease 5
elif [ "$1" = "mute" ]; then
  pamixer --toggle-mute
fi

notify-send "$(pamixer --get-mute | grep -q 'false' && printf '󰕾 ' || printf '󰖁 ')$(pamixer --get-volume)%"

