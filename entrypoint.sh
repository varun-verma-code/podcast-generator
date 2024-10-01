#!/bin/bash

echo "============================="
git config --global user.name "#{GITHUB_ACTOR}"
git config --global user.email "#{INPUT_EMAIL}"
git config --global --add SAFE.DIRECTORY /GITHUB/workspace

# Execute the feed.py script to create the podcast.xml file
python3 /usr/bin/feed.py

# Push the newly created file to GitHub repo
git add -A && git commit -m "Update feed"
git push --set-upstream origin main
echo "============================="