#!/bin/bash

# Path to the directory you want to watch
WATCHED_DIR="/Users/simon/.config/karabiner/"

# Ensure the directory exists and change to it
if cd "$WATCHED_DIR"; then
    echo "Watching directory: $WATCHED_DIR"
else
    echo "Failed to change directory to $WATCHED_DIR. Exiting..."
    exit 1
fi

# Function to handle changes
commit_changes() {

    git add .
    # Get the git diff for all staged files
    diff_output=$(git diff --cached)

    # Remove lines that match '+    "selected"' or '-    "selected"'
    # using egrep with the --invert-match option to exclude these lines
    filtered_diff=$(echo "$diff_output" | egrep --invert-match '^\+(    )*\"selected\"|^\-(    )*\"selected\"')

    # Count the remaining + and - lines to determine if there are any significant changes
    plus_lines=$(echo "$filtered_diff" | grep -c '^\+[^+]')
    minus_lines=$(echo "$filtered_diff" | grep -c '^\-[^-]')

    # Only commit if there are more remaining + or - lines
    if [[ $plus_lines -eq 0 ]] && [[ $minus_lines -eq 0 ]]; then
        echo "No significant changes to commit."
        return 0
    fi

    echo "Committing Changes: $1"
    git commit -m "Auto commit on $(date)"
    git push origin main
}

# Monitoring file changes with fswatch
fswatch --event=414 -E --exclude "(.git|automatic_backups|assets|.DS_Store|.tmp)" "$WATCHED_DIR" | while read file_path; do
    echo "Changed: $file_path"
    commit_changes
done