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
if [ "$(uname)" == "Darwin"  ]; then
    brew install rust-analyzer -y
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux"  ]; then
    mkdir -p ~/.local/bin
    curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
    chmod +x ~/.local/bin/rust-analyzer
fi
