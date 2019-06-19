killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#polybar top &

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mainbar-i3 &
	MONITOR=$m polybar --reload bottombar &
  done
else
  polybar --reload mainbar-i3 &
  polybar --reload bottombar &
fi

#polybar bottom &
