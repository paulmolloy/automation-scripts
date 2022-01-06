#!/bin/bash
if [ -z "$1" ]
  then
    echo "You need to pass a file name to record to."
    exit 1
fi
f_name=$1
dir=~/Videos/recordings/
res_x=3840
res_y=2160
offset_x=0
ffmpeg -f x11grab -video_size ${res_x}x${res_y} -framerate 30 -i :0.0+${offset_x},0.0 -f pulse -i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor  -preset ultrafast -crf 18 -pix_fmt yuv420p $dir$f_name.mkv 

