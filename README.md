# Dotfiles

You know where these should go.

## Installing xcode command line tools

    xcode-select --install

## Brew

Installs brew from https://brew.sh/

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### Brew packages

Add brew packages from `brew.txt`

    xargs brew install < brew.txt

# nvm

Install the node version manager https://github.com/creationix/nvm

    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
