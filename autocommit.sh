#!/bin/bash

# Path to the directory you want to watch
WATCHED_DIR="/Users/simon/.config/karabiner/"

# Navigate to the directory
cd "$WATCHED_DIR"

# Function to handle changes
commit_changes() {
    git add .
    git commit -m "Auto commit on $(date)"
    git push origin main
}

# Monitoring file changes with fswatch
fswatch -o $WATCHED_DIR | while read num; do
    commit_changes
done
