#! /bin/bash

echo "=========================="

ls -la /usr/bin/
pwd
ls -la /usr/bin/venv/bin/

source /usr/bin/venv/bin/activate

pip  install pyyaml

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

git add -A && git commit -m "Update Feed"

git push --set-upstream origin main

echo "=========================="