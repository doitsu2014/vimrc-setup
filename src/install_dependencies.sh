#!/bash/sh
# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

if [ "$(uname)" == "Darwin"  ]; then
    brew install curl
    brew install git
    brew install build-essential cmake
    brew install python python3 python3-pip
    brew install nodejs npm
    # rust-analyzer
    brew install rust-analyzer -y
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux"  ]; then
    sudo apt update
    sudo apt-get install curl -y
    sudo apt-get install git -y
    sudo apt-get install build-essential cmake -y
    sudo apt-get install python python3 python3-pip -y
    sudo apt-get install nodejs npm -y
    # rust-analyzer
    mkdir -p ~/.local/bin
    curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
    chmod +x ~/.local/bin/rust-analyzer
fi

# Javascript, Css, Json dependencies
sudo npm install -g prettier
sudo npm install -g prettier-stylelint
sudo npm install -g prettier-eslint
sudo npm install -g vim-language-server

