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
    echo "copying ~/.zshrc "
    rm ./zshrc.txt
    touch ./zshrc.txt
    echo "\n#####\n#Imported changes start here\n#####\n\n" >> ./zshrc.txt
    cat ~/.zshrc >> ./zshrc.txt
else
    echo "Skipping copying zshrc\n"
fi

echo "\nWant to copy vscode settings.json?\n 1. (Yes)\n 2. (No)\n"
read copy_vscode_settings_confirm
if [ $copy_vscode_settings_confirm -eq 1 ]; then
    echo "copying vscode settings.."
    cp ~/Library/Application\ Support/Code/User/settings.json ./settings.json
else
    echo "Skipping vscode settings.."
fi

echo "Please copy the latest json profile into this directory from\n iterm2>preferences>profiles>Other Actions>Save all profiles as json\n"
echo "run ./import-and-install-configs to import the configs\n"
