#!/bin/sh

birghtness="$(brightnessctl i | awk '/Current brightness/ {print $4}' | tr -d '(%)')"

if [ "$1" = "up" ]; then
  brightnessctl set $((birghtness + 10))%
elif [ "$1" = "down" ]; then
  brightnessctl set $((birghtness - 10))%
fi

birghtness="$(brightnessctl i | awk '/Current brightness/ {print $4}' | tr -d '(%)')"
brightnessicon="󰃟 "

if [ "$birghtness" -lt 10 ]; then
  brightnessicon="󰃞 "
elif [ "$birghtness" -gt 90 ]; then
  brightnessicon="󰃠 "
fi

notify-send "$brightnessicon$birghtness%" &

