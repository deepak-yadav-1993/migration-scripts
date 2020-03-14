echo "copying vs-code extensions..."
code --list-extensions  > vscode-extensions.txt
echo "copying zshrc.."
cp ~/.zshrc ./zshrc.sh

echo "Please copy the latest json profile into this directory from\n iterm2>preferences>profiles>Other Actions>Save all profiles as json\n"
echo "run ./import-and-install-configs to import the configs\n"