#!/bin/bash
set -euo pipefail
width=${2:-80%}
height=${2:-80%}
name=TimeTracking
if [ "$(tmux display-message -p -F "#{session_name}")" = "$name" ]; then
	tmux detach-client
else
	tmux popup -d '#{pane_current_path}' -xC -yC -w$width -h$height -E "tmux attach -t $name || tmux new -s $name 'nvim ~/Documents/Dokumentation/Time/time.md'"
fi
