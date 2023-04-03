#!/bin/bash

#path to the directory to monitor changes
directory=/opt/backup/autoversion_script

#file which will store the current version number
file_version=version.txt

#commit message for version updates
commit_message="updated version"

#function to update the version number in the file_version
function update_version {
    #read the current version number
    current_version=$(cat $file_version)

    #increment the version number
    new_version=$((current_version + 1))

    #write the new version number to the file_version
    echo $new_version > $file_version

    # Commit the updated version number to git
    git add $file_version
    git commit -m "$commit_message: $new_version"
    git branch -M main
    git remote add origin https://github.com/himansh14/Auto-versioning.git
    git fetch origin main
    git rebase main
    git push origin main -f
}

# Monitor the directory for changes using inotify
while true; do
    inotify -q -r -e modify,create,delete $directory
    update_version
done

