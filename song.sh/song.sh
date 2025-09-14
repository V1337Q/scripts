#!/bin/bash

MAX_LEN=15

truncate() {
    local str="$1"
    local max="$2"
    local len=${#str}
    if [ "$len" -gt "$max" ]; then
        # echo "${str:0:max}..."
        echo "${str:0:max}.."
    else
        echo "$str"
    fi
}

# if playerctl status &>/dev/null; then
#     status=$(playerctl status 2>/dev/null)
# if playerctl --player=spotify status &>/dev/null; then
#     status=$(playerctl --player=spotify status 2>/dev/null)

PREFERRED_PLAYERS=("spotify" "vlc" "mpd" "firefox")

player=""
for p in "${PREFERRED_PLAYERS[@]}"; do
    if playerctl --player=$p status &>/dev/null; then
        player=$p
        break
    fi
done

if [ -n "$player" ]; then
    status=$(playerctl --player=$player status 2>/dev/null)
    if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
        artist=$(playerctl --player=$player metadata artist 2>/dev/null)
        title=$(playerctl --player=$player metadata title 2>/dev/null)
        # song=" ${artist} - ${title}"
        song=" ${artist} - ${title}"
        echo "$(truncate "$song" $MAX_LEN)"
    else
        # echo " empty"
        echo " empty"
    fi
else
    # echo " empty"
    echo " empty"
fi
    if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
        artist=$(playerctl metadata artist 2>/dev/null)
        title=$(playerctl metadata title 2>/dev/null)
        # song=" ${artist} - ${title}"
        song=" ${artist} - ${title}"
        echo "$(truncate "$song" $MAX_LEN)"
    else
        # echo " empty"
        echo " empty"
    fi
else
    # echo " empty"
    echo " empty"
fi
