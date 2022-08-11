#!/usr/bin/env bash
#title         :install.sh
#description   :This script will install and configure Fish Shell + Fisher
#author        :ghaiklor
#date          :2021-06-20
#version       :1.0
#usage         :bash <(curl --silent --location "https://github.com/ghaiklor/iterm-fish-fisher-osx/blob/master/install.sh?raw=true")
#bash_version  :3.2.57(1)-release
#===================================================================================

INFO_LEVEL="\033[0;33m"
SUCCESS_LEVEL="\033[0;32m"

function print() {
  echo -e "$1$2\033[0m"
}

function install_cask() {
  local name=$1
  local app=$2
  local cask=$3

  if [[ -d "/Applications/$app" ]]; then
    print "$SUCCESS_LEVEL" "$name already installed, skipping..."
  else
    print "$INFO_LEVEL" "Installing $name..."
    brew install --cask $cask
  fi

}

function install_formulae() {
  local name=$1
  local app=$2
  local formulae=$3

  if which "$app" &>/dev/null; then
    print "$SUCCESS_LEVEL" "$name already installed, skipping..."
  else
    print "$INFO_LEVEL" "Installing $name..."
    brew install $formulae
  fi

}


install_formulae "gpg" "gpg" "gpg"
install_formulae "tree" "tree" "tree"  
install_formulae "cowsay" "cowsay" "cowsay"
install_formulae "htop" "htop" "htop"
install_formulae "cheat" "cheat" "cheat"
install_formulae "terminal-notifier" "terminal-notifier" "terminal-notifier"
install_formulae "grc" "grc" "grc"
install_formulae "duf" "duf" "duf"
install_formulae "btop" "btop" "btop"
install_formulae "hyperfine" "hyperfine" "hyperfine"
install_formulae "httpie" "httpie" "httpie"
install_formulae "lazygit" "lazygit" "jesseduffield/lazygit/lazygit"
install_formulae "lazydocker" "lazydocker" "jesseduffield/lazydocker/lazydocker"
install_formulae "lazynpm" "lazynpm" "jesseduffield/lazynpm/lazynpm"
install_formulae "jq" "jq" "jq"
install_formulae "jo" "jo" "jo"
install_formulae "yq" "yq" "yq"
install_formulae "fx" "fx" "fx"
install_formulae "rebase-tool" "interactive-rebase-tool" "git-interactive-rebase-tool" 

install_cask "Sublime Text" "Sublime Text.app" "sublime-text"
install_cask "JetBrains Toolbox" "JetBrains Toolbox.app" "jetbrains-toolbox"
install_cask "Meld" "Meld.app" "meld"
install_cask "Postman" "Postman.app" "postman"
install_cask "KeyBase" "Keybase.app" "keybase"
install_cask "Sublime Merge" "Sublime Merge.app" "sublime-merge"
install_cask "Insomnia" "Insomnia.app" "insomnia"
install_cask "GPG" "GPG Keychain.app" "gpg-suite"
install_cask "Pine" "Pine.app" "pine"
install_cask "Cake Brew" "Cakebrew.app" "cakebrew"
install_cask "Mark Text" "MarkText.app" "mark-text"
install_cask "Numi" "Numi.app" "numi"
install_cask "Agenda" "Agenda.app" "agenda"
install_cask "Amethyst" "Amethyst.app" "amethyst"