#!/bin/bash

# 定义目录
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
PLUGINS_DIR="$ZSH_CUSTOM/plugins"
THEMES_DIR="$ZSH_CUSTOM/themes"

echo "🚀 开始自动化配置环境..."

# 1. 安装 eza (针对 Ubuntu/Debian)
if ! command -v eza &> /dev/null; then
    echo "📦 正在通过 GitHub 下载安装 eza..."
    wget https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz
    tar -xzvf eza_x86_64-unknown-linux-gnu.tar.gz
    sudo chmod +x eza
    sudo mv eza /usr/local/bin/
    rm eza_x86_64-unknown-linux-gnu.tar.gz
else
    echo "✅ eza 已安装。"
fi

# 2. 克隆插件函数
clone_repo() {
    local target_dir=$1
    local repo_url=$2
    if [ ! -d "$target_dir" ]; then
        echo "📥 正在克隆 $(basename $target_dir)..."
        git clone --depth=1 "$repo_url" "$target_dir"
    else
        echo "✅ $target_dir 已存在，跳过。"
    fi
}

# 3. 下载插件和主题
clone_repo "$PLUGINS_DIR/zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
clone_repo "$PLUGINS_DIR/zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting"
# P10k 官方建议放 themes 目录
mkdir -p "$THEMES_DIR"
clone_repo "$THEMES_DIR/powerlevel10k" "https://github.com/romkatv/powerlevel10k.git"

# 4. 建立配置文件软链接
echo "🔗 正在建立软链接..."
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/p10k.zsh ~/.p10k.zsh

echo "✨ 配置完成！"
echo "👉 请执行: exec zsh"
