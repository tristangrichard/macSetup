#!/bin/sh

echo "Installing Brew..."

###############################################################################
# Brew                                                                        #
###############################################################################

hash brew 2>/dev/null;
if [ $? -eq 1 ]; then
  echo "Homebrew is not installed. I'll do that right away."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade

# brew install imagemagick
brew install tree
# brew install wget
brew install speedtest-cli
# brew pidof
brew install pidof


brew tap caskroom/cask

apps=(
 Atom
 Android-Studio
 Slack
 Tower
 BetterTouchTool
 Zeplin
 Postman
 Google-Chrome
 dropbox
 iTerm2
)

brew cask install "${apps[@]}"
brew cleanup

echo "Installing mas.."
brew install mas

echo "Installing Xcode..."
mas install 497799835 # Xcode
mas install 1176895641 # Spark
