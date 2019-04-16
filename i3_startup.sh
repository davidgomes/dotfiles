set -x

#xrandr --output eDP-1 --mode 1920x1080
setxkbmap -option -option caps:escape
nm-applet &

i3-msg restart

if ! pgrep -x "solaar" > /dev/null
then
	solaar &
fi

xcompmgr &

nitrogen --restore

MX_MASTER_ID=$(xinput --list | grep "MX Master" | tail -1 | awk -F ' ' '{ print $5 }' | awk -F '=' '{ print $2 }')

xinput --set-prop $MX_MASTER_ID "Device Accel Constant Deceleration" 15

TOUCHPAD_ID=$(xinput --list | grep Synaptics | awk -F ' ' '{ print $5 }' | awk -F '=' '{ print $2 }')
xinput --set-prop $TOUCHPAD_ID "libinput Tapping Enabled" 1
xinput --set-prop $TOUCHPAD_ID "libinput Natural Scrolling Enabled" 1

xset r rate 180 30

# swap escape with ascii tilde
xmodmap -e "keycode 9 = grave asciitilde"

xset s off
xset -dpms
xset s noblank

xset -b
