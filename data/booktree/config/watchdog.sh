#!/bin/sh

# Directory to monitor
DIR_TO_WATCH="/data/completed"

# Store the initial state of the directory
initial_state=$(ls -1 "$DIR_TO_WATCH")

while true; do
    # Sleep for a specified interval (e.g., 2 seconds)
    sleep 45

    # Get the current state of the directory
    current_state=$(ls -1 "$DIR_TO_WATCH")

    # Compare the initial state with the current state
    if [ "$initial_state" != "$current_state" ]; then
        echo "Change detected in $DIR_TO_WATCH"
        # Run your Python script here
        /venv/bin/python booktree.py /config/transmission.cfg #run the script 
	# /venv/bin/python booktree.py /config/transmission-calibre.cfg #ebooks now
	/config/update-calibre.sh #better/hacky ebook support

        # Update the initial state
        initial_state="$current_state"
    fi
done
