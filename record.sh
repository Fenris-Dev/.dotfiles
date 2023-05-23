#!/bin/bash

# Get the window ID by selecting a window with the mouse
echo "Click on the window you want to select..."
window_id=$(xdotool selectwindow)

# Activate the window with the given ID
xdotool windowactivate $window_id

# Get the window size and position
window_geometry=$(xdotool getwindowgeometry --shell $window_id)
window_size=$(echo "$window_geometry" | awk '/WIDTH/{print $2"x"$4}')
window_pos=$(echo "$window_geometry" | grep 'X\|Y')

# Extract the width and height values from the size string
width=$(echo "$window_size" | cut -d'x' -f1)
height=$(echo "$window_size" | cut -d'x' -f2)

# Extract the X and Y values from the position string
x=$(echo "$window_pos" | cut -d'=' -f2 | cut -d' ' -f1)
y=$(echo "$window_pos" | cut -d'=' -f4 | cut -d' ' -f1)

# Build the FFmpeg command
ffmpeg -f x11grab -video_size "${width}x${height}" -i "${DISPLAY}+${x},${y}" output.mp4

