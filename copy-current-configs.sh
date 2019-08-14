echo "copying vs-code extensions..."
code --list-extensions  > vscode-extensions.txt
echo "copying zshrc.."
cp ~/.zshrc ./zshrc.txt