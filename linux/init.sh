#!/bin/bash

# 更新系统软件包列表并升级已安装的软件包
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# 安装构建工具、版本控制系统和文本编辑器
echo "Installing development tools..."
sudo apt install -y build-essential git vim curl wget

# 安装 Python 3 和 pip
echo "Installing Python 3 and pip..."
sudo apt install -y python3 python3-pip

# 配置终端环境
echo "Configuring terminal environment..."
echo "export PS1='[\u@\h \W]\$ '" >> ~/.bashrc
echo "alias ll='ls -l --color=auto'" >> ~/.bashrc
echo "alias la='ls -A --color=auto'" >> ~/.bashrc
echo "alias l='ls -CF'" >> ~/.bashrc
echo "alias ..='cd ..'" >> ~/.bashrc
echo "alias ...='cd ../../..'" >> ~/.bashrc
echo "alias ....='cd ../../../..'" >> ~/.bashrc
echo "alias .....='cd ../../../../..'" >> ~/.bashrc
echo "alias rm='rm -i'" >> ~/.bashrc
echo "alias cp='cp -i'" >> ~/.bashrc
echo "alias mv='mv -i'" >> ~/.bashrc
echo "alias grep='grep --color=auto'" >> ~/.bashrc
echo "alias egrep='egrep --color=auto'" >> ~/.bashrc
echo "alias fgrep='fgrep --color=auto'" >> ~/.bashrc
echo "alias vi='vim'" >> ~/.bashrc
echo "alias mkdir='mkdir -pv'" >> ~/.bashrc
echo "alias df='df -h'" >> ~/.bashrc
echo "alias du='du -h'" >> ~/.bashrc
echo "alias top='htop'" >> ~/.bashrc
echo "alias ps='ps auxf'" >> ~/.bashrc
echo "alias cls='clear'" >> ~/.bashrc
source ~/.bashrc

# 安装常用开发工具（如 htop、tree）
echo "Installing additional development tools..."
sudo apt install -y htop tree

# 清理安装包缓存
echo "Cleaning up..."
sudo apt autoremove -y && sudo apt clean


# 安装 Zsh
echo "正在安装 Zsh..."
sudo apt update
sudo apt install -y zsh

# 检查 Zsh 是否安装成功
if ! command -v zsh &> /dev/null; then
    echo "Zsh 安装失败，请检查网络或权限！"
    exit 1
fi

# 设置 Zsh 为默认 shell
echo "将 Zsh 设置为默认 shell..."
chsh -s $(which zsh)

# 安装 Oh-My-Zsh
echo "正在安装 Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 安装 Zsh 插件：zsh-autosuggestions 和 zsh-syntax-highlighting
echo "正在安装 Zsh 插件..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 修改 Zsh 配置文件
echo "正在修改 Zsh 配置文件..."
cat << 'EOF' > ~/.zshrc
# 如果需要自定义主题，可以修改下面的主题名称
ZSH_THEME="agnoster"

# 启用插件
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# 自定义别名
alias ll='ls -l'
alias la='ls -a'
alias grep='grep --color=auto'

# 配置自动补全
autoload -U compinit
compinit

# 配置历史记录
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

# 配置命令行编辑
setopt AUTO_LIST
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

# 配置自动提示
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# 配置语法高亮
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bg=red')

# 配置命令行提示
PROMPT='%F{magenta}%n%f@%F{green}%m%f:%F{yellow}%~%f$ '

# 配置别名
alias ll='ls -l'
alias la='ls -a'
alias grep='grep --color=auto'

# 配置环境变量
export EDITOR=vim
export PAGER=less

# 配置其他自定义设置
EOF

# 重新加载 Zsh 配置
echo "重新加载 Zsh 配置..."
source ~/.zshrc

echo "Zsh 安装和配置完成！"

# git 
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout
