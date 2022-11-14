#!/bin/bash

invalid_response="Invalid Response\n\n"
export_current_configs() {
    read -p "Want to copy vs-code extensions...? (y/n) `echo $'\n> '`" yn
    case $yn in
    [yY] | yes | Yes | YES)
        printf "copying vs-code extensions... into vscode-extensions.txt file\n\n"
        code --list-extensions >vscode-extensions.txt
        ;;
    [nN] | no | No | NO)
        printf "Skipping copying vs-code extensions \n\n"
        ;;
    *)
        printf $invalid_response
        ;;
    esac

    read -p "Want to copy zshrc file?(y/n) `echo $'\n> '`" yn
    case $yn in
    [yY] | yes | Yes | YES)
        echo "copying ~/.zshrc "
        rm ./zshrc.txt
        touch ./zshrc.txt
        echo "\n#####\n#Imported changes start here\n#####\n\n" >>./zshrc.txt
        cat ~/.zshrc >>./zshrc.txt
        printf "\n\n"
        ;;
    [nN] | no | No | NO)
        printf "Skipping copying zshrc\n\n"
        ;;
    *)
        printf $invalid_response
        ;;
    esac

    read -p "Want to copy vscode settings.json?(y/n) `echo $'\n> '`" yn
    case $yn in
    [yY] | yes | Yes | YES)
        printf "copying vscode settings..\n\n"
        cp ~/Library/Application\ Support/Code/User/settings.json ./settings.json
        ;;
    [nN] | no | No | NO)
        printf "Skipping vscode settings..\n\n"
        ;;
    *)
        printf $invalid_response
        ;;
    esac

    printf "\nPlease copy the latest json profile into this directory from\n iterm2>preferences>profiles>Other Actions>Save all profiles as json\n"
    printf "\n\nrun ./import-and-install-configs to import the configs\n"
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    export_current_configs
else
    printf "This script only works for a MAC setup"
fi
