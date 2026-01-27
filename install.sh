#!/bin/bash
# 定义插件目录
ZSH_CUSTOM_DIR=$HOME/.oh-my-zsh/custom/plugins

# 克隆插件函数
clone_plugin() {
    if [ ! -d "$ZSH_CUSTOM_DIR/$1" ]; then
        echo "Installing $1..."
        git clone --depth=1 "$2" "$ZSH_CUSTOM_DIR/$1"
    else
        echo "$1 already installed."
    fi
}

# 下载所需插件
clone_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
clone_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting"
clone_plugin "powerlevel10k" "https://github.com/romkatv/powerlevel10k.git"

# 建立软链接
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/p10k.zsh ~/.p10k.zsh

echo "Done! Please run 'source ~/.zshrc'"
