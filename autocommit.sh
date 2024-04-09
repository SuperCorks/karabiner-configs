#!/bin/bash

# Path to the directory you want to watch
WATCHED_DIR="/Users/simon/.config/karabiner"

# Ensure the directory exists and change to it
if cd "$WATCHED_DIR"; then
    echo "Watching directory: $WATCHED_DIR"
else
    echo "Failed to change directory to $WATCHED_DIR. Exiting..."
    exit 1
fi

# Function to handle changes
commit_changes() {
    if ! git add . ; then
        echo "Failed to add changes."
        return 1
    fi

    if ! git commit -m "Auto commit on $(date)" ; then
        echo "No changes to commit."
        return 1
    fi

    if ! git push origin main ; then
        echo "Failed to push changes."
        return 1
    fi
}

# Monitoring file changes with fswatch
fswatch "$WATCHED_DIR" | while read file_path; do
    echo "Detected: $file_path"
done | stdbuf -oL grep -vE "(\.git|automatic_backups|assets|\.DS_Store)" | while read filtered_path; do
    echo "Changed (Filtered): $filtered_path"
    commit_changes
done
