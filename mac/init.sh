#!/bin/bash

# 终端输出颜色设置
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${GREEN}macOS 初始化脚本启动...${NC}"

# 安装 Homebrew（如果未安装）
if ! command -v brew &>/dev/null; then
    echo -e "${BLUE}Homebrew 未安装，正在安装 Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "${GREEN}Homebrew 已经安装！${NC}"
fi

# 使用 Homebrew 安装 Git（如果未安装）
echo -e "${BLUE}检查 Git 安装...${NC}"
if ! command -v git &>/dev/null; then
    echo -e "${YELLOW}Git 未安装，正在安装 Git...${NC}"
    brew install git
else
    echo -e "${GREEN}Git 已安装！${NC}"
fi

# 使用 Homebrew 安装常用开发工具
echo -e "${BLUE}安装开发工具...${NC}"
brew install zsh
brew install node
brew install python
brew install go
brew install wget
brew install htop
brew install jq
brew install tree
brew install ffmpeg
brew install visual-studio-code
brew install docker
brew install curl
brew install telnet

# 安装 Node.js 包管理工具 yarn
echo -e "${BLUE}安装 Yarn...${NC}"
brew install yarn

# 安装 Python 包管理工具 pipenv
echo -e "${BLUE}安装 pipenv...${NC}"
brew install pipenv

# 安装 Go 模块管理工具
echo -e "${BLUE}安装 Go...${NC}"
brew install go

# 安装 Docker（如果未安装）
echo -e "${BLUE}检查 Docker 安装...${NC}"
if ! command -v docker &>/dev/null; then
    echo -e "${YELLOW}Docker 未安装，正在安装 Docker...${NC}"
    brew install --cask docker
else
    echo -e "${GREEN}Docker 已安装！${NC}"
fi

# 安装 sublime text
brew install --cask sublime-text


# 配置 zsh 为默认 shell 并安装 Oh-My-Zsh
echo -e "${BLUE}配置 Zsh 和 Oh-My-Zsh...${NC}"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${YELLOW}安装 Oh-My-Zsh...${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo -e "${GREEN}Oh-My-Zsh 已安装！${NC}"
fi

# 配置 Git 全局用户信息
echo -e "${BLUE}配置 Git 用户信息...${NC}"
git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"
git config --global core.editor "vim"

# 配置 Go 环境变量
echo -e "${BLUE}配置 Go 环境变量...${NC}"
echo "export GOPATH=\$HOME/go" >> ~/.zshrc
echo "export GOROOT=\$(brew --prefix go)/libexec" >> ~/.zshrc
echo "export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin" >> ~/.zshrc
source ~/.zshrc

# 配置 Python 环境变量
echo -e "${BLUE}配置 Python 环境...${NC}"
echo "export PATH=\"\$(brew --prefix python@3.9)/bin:\$PATH\"" >> ~/.zshrc
source ~/.zshrc

# 安装常用 Node.js 全局包
echo -e "${BLUE}安装常用 Node.js 包...${NC}"
npm install -g typescript eslint prettier

# 安装常用的 VS Code 插件
echo -e "${BLUE}安装 VS Code 插件...${NC}"
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint

# 安装 Rust（可选）
echo -e "${BLUE}安装 Rust...${NC}"
brew install rust

# 配置常用工具的快捷命令
echo -e "${BLUE}配置常用工具的快捷命令...${NC}"
alias ll="ls -la"
alias gs="git status"
alias gd="git diff"
alias gco="git checkout"
alias gst="git stash"
alias vim="nvim"
alias h="htop"

# 更新并清理 Homebrew
echo -e "${BLUE}更新并清理 Homebrew...${NC}"
brew update
brew upgrade
brew cleanup

# 显示安装完成消息
echo -e "${GREEN}macOS 初始化脚本执行完毕！请重新启动终端以使配置生效。${NC}"

