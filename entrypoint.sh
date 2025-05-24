#!/bin/bash

# Execute feed.py
python3 feed.py

# Add all files to a git commit with the message "generating files"
git config --global user.name "github-actions"
git config --global user.email "github-actions@github.com"
git add .
git commit -m "generating files"

# Push the changes (you'll need to set up your GitHub token for this to work)
# git push origin main
