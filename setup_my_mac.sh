#!/bin/sh

echo "Running macSetup"

[[ -e utils/utils.sh ]] || { echo >&2 "Please cd into the bundle before running this script."; exit 1; }

source utils/utils.sh

###############################################################################
# XCode Command Line Tools                                                    #
###############################################################################

notInstalled="xcode-select: note: install requested for command line developer tools"

if [[ $((xcode-\select --install) 2>&1) == ${notInstalled} ]]; then
#if [ ! xcode-select --print-path &> /dev/null ]; then

  # Prompt user to install the XCode Command Line Tools
  #xcode-select --install &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Wait until the XCode Command Line Tools are installed
  echo -n "Waiting"
  while [[ $((xcode-\select --install) 2>&1) == ${notInstalled} ]]; do
    echo -n "."
    sleep 5
  done
  #until xcode-select --print-path &> /dev/null; do
    #sleep 5
  #done

  print_result $? 'Install XCode Command Line Tools'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Point the `xcode-select` developer directory to
  # the appropriate directory from within `Xcode.app`
  # https://github.com/alrra/dotfiles/issues/13

  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
  print_result $? 'Make "xcode-select" developer directory point to Xcode'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Prompt user to agree to the terms of the Xcode license
  # https://github.com/alrra/dotfiles/issues/10

  sudo xcodebuild -license
  print_result $? 'Agree with the XCode Command Line Tools licence'

fi

ask "Install Ohmyzsh?" Y && source install/shell.sh

ask "Install Synlinks?" Y && source symlinks.sh

###############################################################################
# Homebrew                                                                    #
###############################################################################

ask "Install brew apps?" Y && source install/brew.sh

###############################################################################
# macOS Settings                                                              #
###############################################################################

ask "Install macOS Settings?" Y && source os/setup.sh

###############################################################################
# cocoapods                                                                   #
###############################################################################

ask "Install cocoapods apps?" Y && sudo gem install cocoapods
