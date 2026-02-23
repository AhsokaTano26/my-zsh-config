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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# 2. 克隆本仓库
git clone git@github.com:AhsokaTano26/my-zsh-config.git ~/dotfiles

# 3. 执行自动化安装脚本
## Ubuntu/Debian
cd ~/dotfiles && chmod +x install.sh && ./install.sh
## macos
cd ~/dotfiles && chmod +x install-for-mac.sh && ./install-for-mac.sh

# 4. 切换并生效
exec zsh

# 5. 切换默认 Shell 为 Zsh
chsh -s $(which zsh)

# 6. 立即生效
source ~/.zshrc
```

## zsh私有化配置
```bash
nano ~/.zshrc.local
```

## 后续修改

```bash
cd ~/dotfiles

git pull

source ~/.zshrc
```

## 常用快捷指令

### 📂 文件浏览 (基于 eza)
|指令|效果|
|:----:|:----:|
|ls|基础列出（带图标、目录优先）|
|l|详细列表|
|ll|包含 Git 状态的详细列表|
|la|显示隐藏文件及完整权限属性|
|lt|树状图展示目录结构|

### 🛡️ 安全与系统
|指令|效果|
|:----:|:----:|
|rm/cp/mv|操作前增加确认提示 ( -i )|
|port|快速查看 macOS 端口占用情况|
|reload|强制重载 Zsh 配置|
|mkcd [dir]|创建并直接进入该目录|

### 🌿 Git 操作简写
|指令|效果|
|:----:|:----:|
|gs|查看当前仓库状态|
|ga|添加所有改动|
|gp|推送至远程仓库|
|gf|获取远程更新|
