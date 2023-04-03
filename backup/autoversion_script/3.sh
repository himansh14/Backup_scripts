#!/bin/bash

# Set the path to the directory you want to monitor for changes
WATCH_DIR=/opt/backup/autoversion_script/version

# Set the name of the file that will store the current version number
VERSION_FILE=version.txt

# Set the commit message for version updates
COMMIT_MESSAGE="Auto-version update"

# Function to update the version number in the VERSION_FILE
function update_version {
    # Read the current version number
    current_version=$(cat $VERSION_FILE)

    # Increment the version number
    new_version=$((current_version + 1))

    # Write the new version number to the VERSION_FILE
    echo $new_version > $VERSION_FILE

    # Commit the updated version number to git
    git init
    git add $VERSION_FILE
    git commit -m "$COMMIT_MESSAGE: $new_version"
    git branch -M main
    git remote add origin https://github.com/himansh14/Auto-versioning.git
    git fetch origin main
    git rebase main
    git push origin main -f
}

# Monitor the WATCH_DIR directory for changes using inotifywait
while inotifywait -q -e modify,create,delete $WATCH_DIR>/dev/null;do wall "file has been updated to v1.0.1";done
