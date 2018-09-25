#set -x

#xrandr --output eDP-1 --mode 1920x1080
setxkbmap -option -option caps:escape
nm-applet &
solaar &
xcompmgr &
nitrogen --restore &
# id 15 is logitech mx master
xinput --set-prop 15 "Device Accel Constant Deceleration" 15
# id 11 is my touchpad, not my trackpad
xinput --set-prop 16 "libinput Tapping Enabled" 1
xinput --set-prop 16 "libinput Natural Scrolling Enabled" 1
xset r rate 200 20

xset s off
xset -dpms
xset s noblank

