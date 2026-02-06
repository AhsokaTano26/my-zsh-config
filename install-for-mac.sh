#!/bin/bash

# 定义目录
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
PLUGINS_DIR="$ZSH_CUSTOM/plugins"
THEMES_DIR="$ZSH_CUSTOM/themes"

echo "🚀 开始 macOS 自动化环境配置..."

# 1. 安装 eza (适配 Intel 和 Apple Silicon)
if ! command -v eza &> /dev/null; then
    echo "📦 正在检测架构并下载 eza..."
    ARCH=$(uname -m)
    OS="unknown-apple-darwin"
    
    if [ "$ARCH" = "arm64" ]; then
        # Apple Silicon (M1/M2/M3)
        EZA_BIN="eza_aarch64-apple-darwin.zip"
    else
        # Intel Mac
        EZA_BIN="eza_x86_64-apple-darwin.zip"
    fi

    # 下载并解压
    curl -LO "https://github.com/eza-community/eza/releases/latest/download/${EZA_BIN}"
    unzip "$EZA_BIN"
    chmod +x eza
    sudo mv eza /usr/local/bin/
    rm "$EZA_BIN"
    # 清理解压出来的其他琐碎文件（如果有）
    rm -f completions/* man/* 2>/dev/null 
else
    echo "✅ eza 已安装。"
fi

# 2. 克隆函数 (保持不变，很通用)
clone_repo() {
    local target_dir=$1
    local repo_url=$2
    if [ ! -d "$target_dir" ]; then
        echo "📥 正在克隆 $(basename "$target_dir")..."
        git clone --depth=1 "$repo_url" "$target_dir"
    else
        echo "✅ $(basename "$target_dir") 已存在，跳过。"
    fi
}

# 3. 下载插件和主题
mkdir -p "$PLUGINS_DIR"
mkdir -p "$THEMES_DIR"

clone_repo "$PLUGINS_DIR/zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
clone_repo "$PLUGINS_DIR/zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting"
clone_repo "$THEMES_DIR/powerlevel10k" "https://github.com/romkatv/powerlevel10k.git"

# 4. 建立软链接 (假设你的 dotfiles 目录在 ~/dotfiles)
echo "🔗 正在建立配置文件链接..."
if [ -d "$HOME/dotfiles" ]; then
    ln -sf "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
    ln -sf "$HOME/dotfiles/p10k.zsh" "$HOME/.p10k.zsh"
else
    echo "⚠️ 警告：未发现 ~/dotfiles 目录，跳过软链接步骤。"
fi

echo "✨ macOS 配置完成！"
echo "👉 请执行: exec zsh"
