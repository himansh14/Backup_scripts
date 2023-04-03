#!/bin/bash

#version=$(while inotifywait -q -e modify /opt/backup/autoversion_script/version/version.txt>/dev/null;do wall "file has been modified v0.1.1";done)
#echo "$version"

#add a change in the working directory to the staging area
git add "sample3.txt"

#commit the files and give message
git commit -m "commit done to the file"

#git branching specify
git branch -M main

#using set-upstream arg
git branch --set-upstream-to main main

#adding to the remote repository
#git remote add origin https://github.com/himansh14/Auto-versioning.git
	
#fetch the tag
fetch_tags() {
git fetch --all --tags
}

#rebasing the main branch
#git rebase main

#pushing to the main branch
git push -u origin main  

MAJOR=''
MINOR=''
PATCH=''
NEW_TAG=''

#fallback tag
FALLBACK_TAG='v0.1.1'

#latest tag on the current branch
GET_PREVIOUS_TAG() {
PREVIOUS_TAG=$(git describe --abbrev=0 --tags 2>/dev/null || true) 
PREVIOUS_TAG="${PREVIOUS_TAG:-$FALLBACK_TAG}"
PREVIOUS_TAG="${PREVIOUS_TAG/v/}"
#replace dot with space then split into array
PREVIOUS_TAG_ARR=(${PREVIOUS_TAG//./ })
MAJOR="${PREVIOUS_TAG_ARR[0]}"
MINOR="${PREVIOUS_TAG_ARR[1]}"
PATCH="${PREVIOUS_TAG_ARR[2]}"
}

#determine the new tag number(different versions for major minor patch)
SET_LEVEL() {
case $CONDITION in
    "MAJOR")
	echo "update in major version"
        ((MAJOR += 1))
        MINOR=0
        PATCH=0
        ;;
    "MINOR")
	echo "update in minor version"
        ((MINOR += 1))
        PATCH=0
        ;;
    "PATCH")
	echo "update in patch version"
        ((PATCH += 1))
        ;;
    *)
        echo "No version increment specified"
        exit 1
        ;;
esac
}

# Create Git tag.
make_tag() {
  git tag -a "$NEW_TAG" \
    -m "$NEW_TAG"
}

run() {
  echo '
 Fetching tags...'
  fetch_tags
  echo '
 Finding most recent tag...'
  get_last_tag
  echo "
 Last tag: v$MAJOR.$MINOR.$PATCH"
  set_level
  NEW_TAG="v$MAJOR.$MINOR.$PATCH"
  echo "
 New tag: $NEW_TAG" > /opt/backup/autoversion_script/version/version.txt
}
