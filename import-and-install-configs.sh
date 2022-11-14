#!/bin/bash

invalid_response="Invalid Response\n\n"

import_configs() {
    # echo "Install NVM?\n 1. (Yes)\n 2. (No)\n"
    # read nvm_confirmation
    # if [ $nvm_confirmation -eq 1 ]
    # then
    #     curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
    # else
    #     echo "Skipping NVM install\n"
    # fi

    # Check to see if Homebrew is installed, and install it if it is not
    command -v brew >/dev/null 2>&1 || {
        echo >&2 "Installing Homebrew Now"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    }

    printf "Brewing basic graphic based applications\n visual-studio-code \n docker \n spotify \n graphql-ide \n iterm2 \n
    firefox \n google-chrome \n postman\n drawio\n"
    brew update
    brew install --cask visual-studio-code docker spotify graphql-ide iterm2 firefox google-chrome postman drawio

    read -p "\nInstall other brew_cask graphic packages? (y/n) `echo $'\n> '`" yn
    case $yn in
    [yY] | yes | Yes | YES)
        printf "Enter the packages to install separated by space \nExample: docker iterm2 firefox\n"
        read cask_packages
        brew cask install $cask_packages
        ;;
    [nN] | no | No | NO)
        printf "Skipping more brew_cask installs\n\n"
        ;;
    *)
        printf $invalid_response
        ;;
    esac


    printf "Brewing basic development packages \n git zsh nvm zsh-autosuggestions \n"
    brew install git zsh nvm zsh-autosuggestions zsh-syntax-highlighting
    printf "\n Make sure you have nvm home environment variable set up\n export NVM_DIR="$HOME/.nvm""


    read -p "Install other brew packages? (y/n) `echo $'\n> '`" yn
    case $yn in
    [yY] | yes | Yes | YES)
        printf "Enter the packages to install separated by space \nExample: git nvm helm\n"
        read brew_packages
        brew install $brew_packages
        ;;
    [nN] | no | No | NO)
        printf "Skipping more brew installs\n\n"
        ;;
    *)
        printf $invalid_response
        ;;
    esac

    read -p "Will append ~/.zshrc with the contents of file .zshrc.txt ! Continue? (y/n) `echo $'\n> '`" yn
    case $yn in
    [yY] | yes | Yes | YES)
        echo "Appending at the end of .zshrc file"
        # rm ~/.zshrc
        cat zshrc.txt >>~/.zshrc
        ;;
    [nN] | no | No | NO)
        printf "Skipping .zshrc import\n\n"
        ;;
    *)
        printf $invalid_response
        ;;
    esac

    printf "\nInstalling vscode extensions.."
    while read line; do
        code --install-extension $line
    done <vscode-extensions.txt

    printf "\nMoving settings.json.."
    cp settings.json ~/Library/Application\ Support/Code/User/settings.json

    # This to be used only when agnoster theme is being used for zsh
    # echo "\n Installing powerline font\n"
    # {
    #     # clone
    #     git clone https://github.com/powerline/fonts.git --depth=1
    #     # install
    #     cd fonts
    #     ./install.sh
    #     # clean-up a bit
    #     cd ..
    #     rm -rf fonts
    # } &>/dev/null # For no output. Remove &> /dev/null for debugging

    # open https://github.com/powerline/fonts

    # echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"

    echo "\n To make sure terminal font works okay, import ./Profiles.json or Deepak.json in \n iterm2>preferences>profiles>Other Actions>Import JSON Profiles..."

}

if [[ "$OSTYPE" == "darwin"* ]]; then
    import_configs
else
    echo "This script only works for a MAC setup"
fi
