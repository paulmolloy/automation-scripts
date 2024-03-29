#xrandr --output DP-1-1 --scale 2x2 --mode 1920x1080 --fb 3840x2160 --pos 0x0

GPU=$(prime-select query)
if [ "$GPU" == "nvidia" ]
then 
    echo "Resize screen for Nvidia GPU"
    /bin/screen-automation-pablo/nvidia_external_monitor.bash

else
    echo "Resize screen for Intel GPU"
    xrandr --output HDMI1 --scale 2x2 --mode 1920x1200 --fb 3840x2400 --pos 0x0
    xrandr --output HDMI1 --right-of eDP1
    # Get rid of flashing mouse.
    xrandr --output eDP1 --scale 0.9999x0.9999

fi

