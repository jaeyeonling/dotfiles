#! /bin/bash

export ZSH=~/.oh-my-zsh

if [ ! -d $ZSH ]; then
  echo "  > Download oh-my-zsh"
  git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH

  echo "  > Download oh-my-zsh plugins"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
  git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

  echo "  > SetUp dracula theme for zsh"
  SCRIPT_PATH=$(pwd -P)
  dracula_file="$SCRIPT_PATH/zsh/dracula.zsh-theme"
  ln -s $dracula_file $HOME/.oh-my-zsh/themes/dracula.zsh-theme
fi
