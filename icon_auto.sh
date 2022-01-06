#!/bin/sh


spotify_running=false
while true; do
    if pgrep "spotify";
    then
        if [ "$spotify_running" = false ]
        then 

            # process is running
            #echo "setting spotify icon"
            xseticon -name Spotify ~/installation_files/spotify.png
            spotify_running=true

        else
            spotify_running=false
            #echo "waiting..."
        fi
     fi
  #echo "."
  sleep 5
done
