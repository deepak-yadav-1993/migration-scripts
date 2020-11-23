echo "This script only works for a MAC setup"

# echo "Install NVM?\n 1. (Yes)\n 2. (No)\n"
# read nvm_confirmation
# if [ $nvm_confirmation -eq 1 ]
# then
#     curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
# else
#     echo "Skipping NVM install\n"
# fi

# This is work related
echo "Download cenx code and install dependencies?\n 1. (Yes)\n 2. (No)\n"
read cenx_confirmation
if [ $cenx_confirmation -eq 1 ]
then
    echo "Downloading cenx codebase....."
    cd ~ && mkdir ~/Ericsson/code && cd ~/Ericsson/code
    git clone git@git.rosetta.ericssondevops.com:cenx/cenx.git
    
    echo "Installing cenx dependencies..."
    cd ~/Ericsson/code/cenx/apps/frontend/ && nvm install && npm run bootstrap
else
    echo "Skipping CENX download and install\n"
fi

echo "Brewing basic graphic based applications\n visual-studio-code \n docker \n spotify \n graphql-ide \n iterm2 \n 
firefox \n google-chrome \n microsoft-teams\n postman\n"
brew update
brew cask install visual-studio-code docker spotify graphql-ide iterm2 firefox google-chrome microsoft-teams postman

echo "\nInstall other brew_cask graphic packages?\n 1. (Yes)\n 2. (No)\n"
read brew_cask_packages_confirmation
if [ $brew_cask_packages_confirmation -eq 1 ]
then
    echo "Enter the packages to install separated by space \nExample: docker iterm2 firefox\n"
    read cask_packages
    brew cask install $cask_packages
else
    echo "Skipping more brew_cask installs\n"
fi

echo "Brewing basic development packages \n git nvm \n"
brew install git zsh nvm
echo "\n Make sure you have nvm home environment variable set up\n export NVM_DIR="$HOME/.nvm""

echo "\nInstall other brew packages?\n 1. (Yes)\n 2. (No)\n"
read brew_packages_confirmation
if [ $brew_packages_confirmation -eq 1 ]
then
    echo "Enter the packages to install separated by space \nExample: git nvm helm\n"
    read brew_packages
    brew install $brew_packages
else
    echo "Skipping more brew installs\n"
fi

echo "Copying zshrc.."
rm ~/.zshrc
cat zshrc.sh >> ~/.zshrc

echo "\nInstalling vscode extensions.."
while read line
do  code --install-extension $line
done < vscode-extensions.txt
