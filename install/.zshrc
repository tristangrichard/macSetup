MACSETUP=$HOME/.macSetup

export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$MACSETUP/zsh

ZSH_THEME="robbyrussell"
# ZSH_THEME="nick"

plugins=(git)

# source $MACSETUP/shell/paths

### Handle functions ###
for file in $(find ${MACSETUP}/install -name functions.sh); do
  source ${file}
done;

### Handle alias ###
for file in $(find ${MACSETUP}/install -name alias.sh); do
  source ${file}
done;



# Homebrew
export HOMEBREW_NO_ANALYTICS=1 # Don't send analytics https://docs.brew.sh/Analytics.html
alias cask='brew cask'

# Cli
alias c="clear"

alias refresh="source ~/.zshrc"
alias fs="du -sh */"

# Xcode derived data
alias cxd="rm -rf /Users/tristanrichard/Library/Developer/Xcode/DerivedData"

# Show hide files
alias hf="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"
alias sf="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"

# Cask
alias caskupdate="brew cask reinstall 'brew cask outdated'"

# Android
alias adb="/Users/trr/Library/Android/sdk/platform-tools/adb"


# Source local extra (private) settings specific to machine if it exists
[ -f ~/.zsh.local ] && source ~/.zsh.local

source $ZSH/oh-my-zsh.sh
