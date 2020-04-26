#!/bin/bash

# set the icon and a temporary location for the screenshot to be stored
icon="$HOME/Pictures/lock.png"
tmpbg='/tmp/screen.png'

# take a screenshot
scrot "$tmpbg"

# blur the screenshot
mogrify -scale 10% -scale 1000% "$tmpbg" # more blur
#convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg" # less blur

# overlay the icon onto the screenshot
convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

# lock the screen with the blurred screenshot
i3lock -i "$tmpbg"
rm $tmpbg