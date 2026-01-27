# 🚀 My Ultimate Zsh Dotfiles

这是我的个人终端环境配置文件仓库。基于 **Zsh** + **Oh My Zsh**，并使用 **Powerlevel10k** 进行视觉增强。



## ✨ 特性

* **主题**: [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - 极致响应速度与颜值。
* **智能补全**: `zsh-autosuggestions` 根据历史记录自动提示。
* **语法高亮**: `zsh-syntax-highlighting` 实时检测命令正确性。
* **目录跳转**: `z` 插件，一键直达高频目录。
* **现代 ls**: 使用 `eza` 替代传统 `ls`，支持图标显示与 Git 状态。
* **自动化**: 提供 `install.sh` 脚本，一键完成多环境部署。

## 🛠️ 快速安装

在任何全新的 **Ubuntu/Debian** 环境下，只需运行：

```bash
# 0. 安装基础软件（如尚未安装）
# Ubuntu/Debian 示例
sudo apt update && sudo apt install -y zsh git curl

# 1. 安装基础框架 Oh My Zsh (如果尚未安装)
sh -c "$(curl -fsSL [https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh))" "" --unattended

# 2. 克隆本仓库
git clone [https://github.com/AhsokaTano26/my-zsh-config.git](https://github.com/AhsokaTano26/my-zsh-config.git) ~/dotfiles

# 3. 执行自动化安装脚本
cd ~/dotfiles && chmod +x install.sh && ./install.sh

# 4. 切换并生效
exec zsh
