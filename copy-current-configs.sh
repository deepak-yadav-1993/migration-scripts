echo "Installing NVM...."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

echo "copying vs-code extensions..."
code --list-extensions  > vscode-extensions.txt
echo "copying zshrc.."
cp ~/.zshrc ./zshrc.txt

echo "Downloading cenx codebase....."
cd ~ && mkdir ~/Ericsson/code && cd ~/Ericsson/code
git clone git@git.rosetta.ericssondevops.com:cenx/cenx.git

echo "Installing cenx dependencies..."
cd ~/Ericsson/code/cenx/apps/frontend/ && nvm install && npm install
