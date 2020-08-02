#! /bin/bash

if test ! $(which brew); then
    echo "  > Install homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

SCRIPT_PATH=$(dirname $0)
brew_file="$SCRIPT_PATH/BrewFile"
if [ ! -f "$brew_file" ]; then
    echo "  > $brew_file doesn't exist"
    exit 1
fi

echo "  > Update homebrew"
brew update
brew bundle --file=$brew_file

echo "  > Cleanup homebrew"
brew cleanup
