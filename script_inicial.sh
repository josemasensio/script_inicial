sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove

mkdir ~/Proyectos

ln -sr ~/Proyectos /var/www/html/

sudo apt -y install curl

sudo apt -y install git

sudo apt -y install lsb-release apt-transport-https ca-certificates 
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg


#################### PHP ###################################
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

sudo apt update
sudo apt -y install php7.4
sudo apt -y install php7.4-mbstring
sudo apt -y install php7.4-json
sudo apt -y install php7.4-xml
sudo apt -y install php7.4-zip
sudo apt -y install php7.4-cli
sudo apt -y install wget
sudo apt -y install unzip
sudo apt -y install npm

#################### Spotify ################################
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get -y update && sudo apt-get -y install spotify-client

#################### VSCODE ##################################
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get -y install apt-transport-https
sudo apt-get -y update
sudo apt-get -y install code

##################### VIM EDITOR ###########################
sudo apt-get -y install vim

################## Chrome #####################
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt -y --fix-broken install

################# Github desktop #################
wget https://github.com/shiftkey/desktop/releases/download/release-2.3.1-linux1/GitHubDesktop-linux-2.3.1-linux1.deb
sudo dpkg -i GitHubDesktop-linux-2.3.1-linux1.deb

################### TWEAKS ##########################
sudo apt -y install gnome-shell-extension
sudo apt -y install chrome-gnome-shell
sudo apt -y install numix-icon-theme-circle

################## GRUB Customizer #################
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt update
sudo apt -y install grub-customizer
sudo add-apt-repository --remove ppa:danielrichter2007/grub-customizer

##################### Tor Browser ###########################
sudo apt -y install torbrowser-launcher

##################### Composer ###########################
EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

##################### VSCode extensions #####################
code --install-extension ms-vscode.cpptools
code --install-extension formulahendry.code-runner
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension eamodio.gitlens
code --install-extension zignd.html-css-class-completion
code --install-extension onecentlin.laravel-blade
code --install-extension felixfbecker.php-debug
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension felixfbecker.php-intellisense
code --install-extension kokororin.vscode-phpfmt
code --install-extension esbenp.prettier-vscode
code --install-extension christian-kohler.path-intellisense
code --install-extension ms-python.python
code --install-extension cymonk.sql-formatter
code --install-extension dotjoshjohnson.xml
code --install-extension tomoki1207.pdf
code --install-extension redhat.vscode-yaml
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension firefox-devtools.vscode-firefox-debug
code --install-extension ms-vscode.vs-keybindings

code --enable-proposed-api ms-vscode.cpptools
code --enable-proposed-api formulahendry.code-runner
code --enable-proposed-api msjsdiag.debugger-for-chrome
code --enable-proposed-api eamodio.gitlens
code --enable-proposed-api zignd.html-css-class-completion
code --enable-proposed-api onecentlin.laravel-blade
code --enable-proposed-api felixfbecker.php-debug
code --enable-proposed-api bmewburn.vscode-intelephense-client
code --enable-proposed-api felixfbecker.php-intellisense
code --enable-proposed-api kokororin.vscode-phpfmt
code --enable-proposed-api esbenp.prettier-vscode
code --enable-proposed-api christian-kohler.path-intellisense
code --enable-proposed-api ms-python.python
code --enable-proposed-api cymonk.sql-formatter
code --enable-proposed-api dotjoshjohnson.xml
code --enable-proposed-api tomoki1207.pdf
code --enable-proposed-api redhat.vscode-yaml
code --enable-proposed-api shd101wyy.markdown-preview-enhanced
code --enable-proposed-api firefox-devtools.vscode-firefox-debug
code --enable-proposed-api ms-vscode.vs-keybindings


if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet --install-dir=/bin --filename=composer
RESULT=$?
rm composer-setup.php
exit $RESULT


