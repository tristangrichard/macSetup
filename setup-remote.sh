#!/usr/bin/env bash

[[ -x `command -v wget` ]] && CMD="wget --no-check-certificate -O -"
[[ -x `command -v curl` ]] >/dev/null 2>&1 && CMD="curl -#L"

if [ -z "$CMD" ]; then
  echo "No curl or wget available. Aborting."
else
  echo "Downloading macSetup..."
  mkdir -p ~/.macSetup

  eval "$CMD https://github.com/tristanrichard/macSetup/archive/master.zip | tar -xzv -C ~/.macSetup --strip-components=1 --exclude='{.gitignore}'"

  cd ~/.macSetup
  . ./setup_my_mac.sh

  . ./setup-git.sh
fi
