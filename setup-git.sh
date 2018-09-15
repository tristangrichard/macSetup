#!/usr/bin/env bash

echo "Setting up the Git repo so you can just update with git pull"
git clone https://github.com/tristanrichard/macSetup.git ./.tmp

cp -r .tmp/.git .git
rm -rf .tmp

git reset --hard

echo "All done! To update run 'cd ~/.macSetup && git pull'"
