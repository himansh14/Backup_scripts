#!/bin/bash

#version=$(while inotifywait -q -e modify /opt/backup/autoversion_script/version/version.txt>/dev/null;do wall "file has been modified v0.1.1";done)
#echo "$version"

#add a change in the working directory to the staging area
git add .

#commit the files and give message
git commit -m "commit done to the file"

#git branching specify
git branch -M main

#using set-upstream arg
git branch --set-upstream-to main main

#adding to the remote repository
#git remote add origin https://github.com/himansh14/Auto-versioning.git
	
#fetch the branch we want to push the code
#git fetch origin main 

#rebasing the main branch
#git rebase main

#pushing to the main branch
git push -u origin main  

#latest tag on the current branch
LATEST_TAG=$(git describe --tags --abbrev=0 | awk -F. '{OFS="."; $NF+=1; print $0}')

#different versions for major minor patch
MAJOR=$(echo "$LATEST_TAG" | awk -F. '{print $1}')
MINOR=$(echo "$LATEST_TAG" | awk -F. '{print $2}')
PATCH=$(echo "$LATEST_TAG" | awk -F. '{print $3}')

#version upgrade based on the commit messages
#COMMIT_MESSAGE=$(git log --all)
#echo "$COMMIT_MESSAGE"

while true; do
read -r $CONDITION
case $CONDITION in
    *#MAJOR*)
	echo "update in major version"
        MAJOR=$((MAJOR+1))
        MINOR=0
        PATCH=0
        ;;
    *#MINOR*)
	echo "update in minor version"
        MINOR=$((MINOR+1))
        PATCH=0
        ;;
    *#PATCH*)
	echo "update in patch version"
        PATCH=$((PATCH+1))
        ;;
    *)
        echo "No version increment specified"
        exit 1
        ;;
esac
done

#create new tag
NEW_TAG="v$MAJOR.$MINOR.$PATCH"i
git tag "$NEW_TAG"
echo "Tagging new version: $NEW_TAG" > /opt/backup/autoversion_script/version/version.txt 
