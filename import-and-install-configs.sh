echo "This script only works for a MAC setup"

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

echo "Brewing basic graphic based applications\n visual-studio-code \n docker \n spotify \n graphql-ide \n iterm2 \n
firefox \n google-chrome \n microsoft-teams\n postman\n"
brew update
brew install --cask visual-studio-code docker spotify graphql-ide iterm2 firefox google-chrome microsoft-teams postman

echo "\nInstall other brew_cask graphic packages?\n 1. (Yes)\n 2. (No)\n"
read brew_cask_packages_confirmation
if [ $brew_cask_packages_confirmation -eq 1 ]; then
    echo "Enter the packages to install separated by space \nExample: docker iterm2 firefox\n"
    read cask_packages
    brew cask install $cask_packages
else
    echo "Skipping more brew_cask installs\n"
fi

echo "Brewing basic development packages \n git zsh nvm zsh-autosuggestions \n"
brew install git zsh nvm zsh-autosuggestions zsh-syntax-highlighting
echo "\n Make sure you have nvm home environment variable set up\n export NVM_DIR="$HOME/.nvm""

echo "\nInstall other brew packages?\n 1. (Yes)\n 2. (No)\n"
read brew_packages_confirmation
if [ $brew_packages_confirmation -eq 1 ]; then
    echo "Enter the packages to install separated by space \nExample: git nvm helm\n"
    read brew_packages
    brew install $brew_packages
else
    echo "Skipping more brew installs\n"
fi

echo "\nWill replace current .zshrc with the file located in this directory! Continue?\n 1. (Yes)\n 2. (No)\n"
read zshrc_import_confirm
if [ $zshrc_import_confirm -eq 1 ]; then
    echo "Copying zshrc.."
    rm ~/.zshrc
    cat zshrc.sh >>~/.zshrc
else
    echo "Skipping .zshrc import\n"
fi

echo "\nInstalling vscode extensions.."
while read line; do
    code --install-extension $line
done <vscode-extensions.txt

echo "\nMoving settings.json.."
cp settings.json ~/Library/Application\ Support/Code/User/settings.json

echo "\n Installing powerline font\n"
{
    # clone
    git clone https://github.com/powerline/fonts.git --depth=1
    # install
    cd fonts
    ./install.sh
    # clean-up a bit
    cd ..
    rm -rf fonts
} &>/dev/null # For no output. Remove &> /dev/null for debugging

echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"

echo "\n To make sure terminal font works okay, import ./Profiles.json in \n iterm2>preferences>profiles>Other Actions>Import JSON Profiles..."
