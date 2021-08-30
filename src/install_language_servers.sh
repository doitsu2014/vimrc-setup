echo "************************************************************************************************************************************************************************"
echo "*************** ************* ************* ************* *************  ************* ************* ************* ************* ************* ************* ***********"
echo "**                                                               Downloading language server protocols                                                               ***"
echo "*************** ************* ************* ************* *************  ************* ************* ************* ************* ************* ************* ***********"
echo "************************************************************************************************************************************************************************"

# Html, Javascript, Css, Json dependencies
sudo npm i -g prettier
sudo npm i -g prettier-stylelint
sudo npm i -g prettier-eslint

# Bash
sudo npm i -g bash-language-server

# Vim
sudo npm i -g vim-language-server

# Python
sudo npm i -g pyright


# rust-analyzer
mkdir -p ~/.local/bin
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

# markdownlint
sudo gem install mdl

if [ "$(uname)" == "Darwin"  ]; then
    brew install pandoc

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux"  ]; then
    # this if statement is used to install dependency packages of ubuntu which has the version > 16.x.x
    sudo apt-get install pandoc -y
fi
