#!/bin/sh
# META:ICON = "video-only-1080p.png"
xrandr --output LVDS-1 --off --output DP-1 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-1 --off
~/myrepos/small_scripts/wallpaper_restore.sh
~/.screenlayout/audio-to-HDMI.sh
~/.screenlayout/wacom-desktop.sh
~/myrepos/small_scripts/skippy-xd-restart.sh

# --dpi 96x96 because: https://www.reddit.com/r/chrome/comments/36u42i/psa_set_dpi_to_96x96_to_fix_several_chrome_43/
