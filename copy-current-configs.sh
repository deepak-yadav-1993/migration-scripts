echo "\nWant to copy vs-code extensions...?\n 1. (Yes)\n 2. (No)\n"
read copy_vs_extension_confirm
if [ $copy_vs_extension_confirm -eq 1 ]; then
    echo "copying vs-code extensions... into vscode-extensions.txt file"
    code --list-extensions >vscode-extensions.txt
else
    echo "Skipping copying vs-code extensions\n"
fi

echo "\nWant to copy zshrc file?\n 1. (Yes)\n 2. (No)\n"
read copy_zshrc_confirm
if [ $copy_zshrc_confirm -eq 1 ]; then
    echo "copying zshrc.."
    cp ~/.zshrc ./zshrc.sh
else
    echo "Skipping copying zshrc\n"
fi

echo "Please copy the latest json profile into this directory from\n iterm2>preferences>profiles>Other Actions>Save all profiles as json\n"
echo "run ./import-and-install-configs to import the configs\n"
