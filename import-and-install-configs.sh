echo "Install NVM?\n 1. Yes 2. No\n"
read nvm_confirmation
if [ $nvm_confirmation -eq 1 ]
then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
else
    echo "Skipping NVM install\n"
fi

echo "Download cenx code and install dependencies?\n 1. Yes 2. No\n"
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

echo "Enter the packages to install separated by space \nExample: git nvm helm\n"
read packages

brew install $packages

echo "Brewing basic graphic based applications\n visual-studio-code \n docker \n spotify \n graphql-ide \n iterm2 \n firefox \n google-chrome \n microsoft-teams\n"
brew cask install \\
visual-studio-code \
docker \
spotify \
graphql-ide \
iterm2 \
firefox \
google-chrome \
microsoft-teams

echo "Install other brew_cask graphic packages?\n 1. Yes\n 2. No\n"
read brew_cask_packages_confirmation
if [ $brew_cask_packages_confirmation -eq 1 ]
then
    echo "Enter the packages to install separated by space \nExample: docker iterm2 firefox\n"
    read cask_packages
    brew cask install $cask_packages
else
    echo "Skipping more brew_cask installs\n"
fi

echo "Copying zshrc.."
cat zshrc.txt >> ~/.zshrc

echo "Installing vscode extensions.."
while read line
do  code --install-extension $line
done < vscode-extensions.txt
