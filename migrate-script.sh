echo "Installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && brew tap caskroom/cask

echo "Installing oh-my-zsh"
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "brewing some basic utils"
brew install \ 
git

echo "Brewing graphic based applications"
brew cask install \ 
visual-studio-code \ 
docker \ 
spotify \ 
graphql-ide \ 
iterm2 \ 
firefox \ 
google-chrome \ 
microsoft-teams

echo "Copying zshrc.."
cat zshrc.txt >> ~/.zshrc

echo "Installing vscode extensions.."
while read line
do  code --install-extension $line
done < vscode-extensions.txt
