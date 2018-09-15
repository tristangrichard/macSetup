#!/bin/sh

echo "Setting up Dock..."

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent true
