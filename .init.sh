#!/bin/bash
alias_file=./.aliasrc
zshrc_file=~/.zshrc
zsh_dir=~/.oh-my-zsh
function init(){
  if [ ! -f "$zsh_dir" ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git $zsh_dir
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    brew install autojump
    brew install fzf
    brew install tmux
    $(brew --prefix)/opt/fzf/install
    cp .zshrc $zshrc_file
  fi
  if [ -f "$zshrc_file" ]; then
    is_exists_aliasrc
    if [ $? != 1 ]; then
      echo "" >> $zshrc_file
      echo "if [ -f ~/.aliasrc ]; then" >> $zshrc_file
      echo "    . ~/.aliasrc" >> $zshrc_file
      echo "fi" >> $zshrc_file
    fi
    cp -f $alias_file ~/.aliasrc
  fi
}

function is_exists_aliasrc(){
    if test -z "$(grep -w .aliasrc $zshrc_file)"
    then
      return 0
    else
      return 1
    fi
}

init
