set -x

#xrandr --output eDP-1 --mode 1920x1080
setxkbmap -option -option caps:escape
nm-applet &

if ! pgrep -x "solaar" > /dev/null
then
	solaar &
fi

xcompmgr &
nitrogen --restore &
# id 15 is logitech mx master
xinput --set-prop 15 "Device Accel Constant Deceleration" 15
# id  is my touchpad, not my trackpad

TOUCHPAD_ID=$(xinput --list | grep TouchPad | awk -F ' ' '{ print $6 }' | awk -F '=' '{ print $2 }')

echo $TOUCHPAD_ID

xinput --set-prop $TOUCHPAD_ID "libinput Tapping Enabled" 1
xinput --set-prop $TOUCHPAD_ID "libinput Natural Scrolling Enabled" 1
xset r rate 200 20

xset s off
xset -dpms
xset s noblank

xset -b
