#! /bin/bash
#This script will eventually setup everything

#XCode command line tools
xcode-select --install
sleep 1
osascript <<END
tell application "System Events"
    tell process "Install Command Line Developer Tools"
        keystroke return
        click button "Agree" of window "License Agreement"
    end tell
end tell
END

#Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install tidy-html5 hub gpg-agent mongodb node macvim reattach-to-user-namespace tmux zsh python mas tree
#Install RVM & Ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby

#Install Sublime Text
brew install Caskroom/cask/sublime-text

#Install globals for Sublime Text plugins
npm i -g eslint eslint-plugin-react eslint-plugin-babel eslint-plugin-html babel-eslint
gem install rubocop haml

pip install powerline-status

echo "Please enter your name (for git config): "
read gitname
echo "Please enter your email (for git config): "
read gitemail
git config --global user.name "$gitname"
git config --global user.email "$gitemail"
git config --global credential.helper osxkeychain
#Setup hub to access Github account...?
mkdir ~/Projects && cd $_
hub clone dotFiles ~/.dotFiles
cd ~/
ln -s ./dotFiles/Sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
ln -s ./dotFiles/Sublime/OS ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
for X in gitignore_global eslintrc rubocop.yml rspec jsbeautifyrc; do ln -s ~/.dotFiles/$X .$X; done
ln -s ~/.dotFiles/tmux/config/powerline/themes/tmux/default.json ~/.config/powerline/themes/tmux/default.json
ln -s ~/.dotFiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotFiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotFiles/zsh/zprofile ~/.zprofile
git config --global core.excludesfile ~/.gitignore_global

#Get other apps
cd ~/Downloads
curl -sSLO https://cachefly.alfredapp.com/Alfred_3.0.3_694.dmg
curl -sSLO https://www.iterm2.com/nightly/latest
curl -sSLO https://app-updates.agilebits.com/download/OPM4
curl -sSLO http://download.bjango.com/istatmenus/
curl -sSLO https://tug.org/mactex/mactex-download.html
mas install 497799835 #xcode
mas install 449589707 #dash
mas install 715768417 #MS remote desktop
