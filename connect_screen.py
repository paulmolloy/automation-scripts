#!/usr/bin/env python3
import subprocess
import time

# Sources 
# https://askubuntu.com/questions/630202/run-script-when-monitor-is-connected
# https://frdmtoplay.com/i3-udev-xrandr-hotplugging-output-switching/
#--- set both commands (connect / disconnect) below
connect_command = "/bin/screen-automation-pablo/external_monitor.bash"
disconnect_command = ""
#---

def get(cmd): return subprocess.check_output(cmd).decode("utf-8")
# - to count the occurrenc of " connected "
def count_screens(xr): return xr.count(" connected ")
# - to run the connect / disconnect command(s)
def run_command(cmd): subprocess.Popen(["/bin/bash", "-c", cmd])

# first count
xr1 = None

while True:
    time.sleep(5)
    # second count
    xr2 = count_screens(get(["xrandr"]))
    # check if there is a change in the screen state
    if xr2 != xr1:
        print("change")
        if xr2 == 2:

            # command to run if connected (two screens)
            run_command(connect_command)
        elif xr2 == 1:
            # command to run if disconnected (one screen)
            # uncomment run_command(disconnect_command) to enable, then also comment out pass
            pass
            # run_command(disconnect_command)
    # set the second count as initial state for the next loop
    xr1 = xr2
