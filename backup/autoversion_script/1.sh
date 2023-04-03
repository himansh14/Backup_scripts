#!/bin/bash

# Define the directory to monitor and the version file
DIR_TO_MONITOR="/path/to/directory"
VERSION_FILE="/path/to/version.txt"

# Set the initial version number
VERSION_NUMBER=0

# Check if the version file exists and read the current version number
if [ -f $VERSION_FILE ]; then
  VERSION_NUMBER=$(cat $VERSION_FILE)
fi

# Monitor the directory for changes
inotifywait -m -r -e modify,create,delete $DIR_TO_MONITOR | while read path action file; do
  # Increment the version number
  VERSION_NUMBER=$((VERSION_NUMBER+1))

  # Update the version file
  echo $VERSION_NUMBER > $VERSION_FILE

  # Output the new version number and the file that triggered the change
  echo "Version $VERSION_NUMBER: $file $action"
done

