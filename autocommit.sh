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
fswatch $WATCHED_DIR | while read file_path; do
    echo "Changed: $file_path"
    commit_changes
done
