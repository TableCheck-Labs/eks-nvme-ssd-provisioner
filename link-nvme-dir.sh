#!/bin/bash

# Define the target and link locations
TARGET_DIR="/pv-disks"
LINK_NAME="/disk"

# Find the first (and should be the only) directory / symbolic link inside the target directory
DIRECTORY=$(find $TARGET_DIR -mindepth 1 -maxdepth 1 -type d -or -type l | head -n 1)

# Check if the directory was found
if [ -z "$DIRECTORY" ]; then
    echo "No directory found in $TARGET_DIR"
    exit 1
fi

# Remove the existing link if it exists
if [ -L "$LINK_NAME" ]; then
    echo "Removing existing link $LINK_NAME"
    rm "$LINK_NAME"
elif [ -e "$LINK_NAME" ]; then
    echo "$LINK_NAME exists but is not a link, manual intervention required."
    exit 2
fi

# Create a new symbolic link
ln -s "$DIRECTORY" "$LINK_NAME"
echo "Link created: $LINK_NAME -> $DIRECTORY"
ls -lart $LINK_NAME
