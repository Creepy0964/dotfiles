killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi

setxkbmap -layout us,ru
# change 'us,ru' to preferrable layouts if you are not using Russian keyboard
setxkbmap -option 'grp:alt_shift_toggle'
xset s off
xset -dpms
