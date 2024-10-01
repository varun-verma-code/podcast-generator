#!/bin/bash

echo "============================="
git config --global user.name "#{GITHUB_ACTOR}"
git config --global user.email "#{INPUT_EMAIL}"
# Error "fatal: detected dubious ownership in repository at '/github/workspace'". Adding safe.directory prevents this.
git config --global --add safe.directory /github/workspace

# Execute the feed.py script to create the podcast.xml file
python3 /usr/bin/feed.py

# Push the newly created podcast.xml file output from script to GitHub repo
git add -A && git commit -m "Update feed"
git push --set-upstream origin master
echo "============================="