#!/usr/bin/env bash
#title         :install.sh
#description   :This script will install and configure Fish Shell + Fisher
#author        :ghaiklor
#date          :2021-06-20
#version       :1.0
#usage         :bash <(curl --silent --location "https://github.com/ghaiklor/iterm-fish-fisher-osx/blob/master/install.sh?raw=true")
#bash_version  :3.2.57(1)-release
#===================================================================================

set -ueo pipefail

PATH=/opt/homebrew/bin:$PATH
TEMP_DIR=$(mktemp -d)
HOME=$(cd && pwd)
COLOR_SCHEME_URL="https://github.com/MartinSeeler/iterm2-material-design/blob/6bd6c8b3627d079ed3ed74e152b12b1db1eb3a6b/material-design-colors.itermcolors?raw=true"
FIRA_CODE_URL="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Retina/complete/Fira%20Code%20Retina%20Nerd%20Font%20Complete.ttf"
INCOSOLATA_URL="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Inconsolata/complete/Inconsolata%20Regular%20Nerd%20Font%20Complete.ttf"
HACK_URL="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf"
MONONOKI_URL="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete.ttf"
MESLO_URL="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf"
PLUGINS_INSTALLER_URL="https://github.com/ghaiklor/iterm-fish-fisher-osx/blob/master/install_plugins.sh?raw=true"

INFO_LEVEL="\033[0;33m"
SUCCESS_LEVEL="\033[0;32m"

function print() {
  echo -e "$1$2\033[0m"
}

function print_banner() {
  print "$INFO_LEVEL" "                                                       "
  print "$INFO_LEVEL" "       ____ _ ____ _  _ ____ _  _ ____ _    _          "
  print "$INFO_LEVEL" "       |___ | [___ |__| [___ |__| |___ |    |          "
  print "$INFO_LEVEL" "       |    | ___] |  | ___] |  | |___ |___ |___       "
  print "$INFO_LEVEL" "                                                       " 
  print "$INFO_LEVEL" "        Command Line Tools + Homebrew + iTerm2         "
  print "$INFO_LEVEL" "             Material Design + Nerd Fonts              "
  print "$INFO_LEVEL" "         Fish Shell + Fisher + Plugins\Themes          "
  print "$INFO_LEVEL" " ----------------------------------------------------- "
  print "$INFO_LEVEL" "                      Brews                            "
  print "$INFO_LEVEL" " tree + gpg + cowsay + htop + cheat + grc + duf + btop "
  print "$INFO_LEVEL" "  terminal-notifier + duf + hyperfine + httpie + pine  "
  print "$INFO_LEVEL" " lazzygit + lazzynpm + lazzydocker + jq + jo + yq + fx "
  print "$INFO_LEVEL" " interactive-rebase-tool                               "
  print "$INFO_LEVEL" " ----------------------------------------------------- "
  print "$INFO_LEVEL" "                       Casks                           "
  print "$INFO_LEVEL" "   JetBrains Toolbox + Sublime Text + Meld + PostMan   "
  print "$INFO_LEVEL" "  Keybase + Sublime Merge + Insomnia + gpg-suite       "
  print "$INFO_LEVEL" " ----------------------------------------------------- "
  print "$INFO_LEVEL" "                      Nerd Fonts                       "
  print "$INFO_LEVEL" "   Fira Code + Incosolata + Hack + Mononoki + Meslo    " 
  print "$INFO_LEVEL" " ----------------------------------------------------- "
  print "$INFO_LEVEL" "                 by @ghaiklor                          "
  print "$INFO_LEVEL" "          modified by @marceloOrigoni                  "
  print "$INFO_LEVEL" "                                                       "
}

function install_command_line_tools() {
  if xcode-select --print-path &>/dev/null; then
    print "$SUCCESS_LEVEL" "Command Line Tools already installed, skipping..."
  else
    print "$INFO_LEVEL" "Installing Command Line Tools..."

    xcode-select --install &>/dev/null
    until xcode-select --print-path &>/dev/null; do
      sleep 5
    done
  fi
}

function install_homebrew() {
  if which brew &>/dev/null; then
    print "$SUCCESS_LEVEL" "Homebrew already installed, skipping..."
  else
    print "$INFO_LEVEL" "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

function install_iterm() {
  if [[ -d /Applications/iTerm.app ]]; then
    print "$SUCCESS_LEVEL" "iTerm 2 already installed, skipping..."
  else
    print "$INFO_LEVEL" "Installing iTerm 2..."
    brew install --cask iterm2
  fi
}

function install_iterm_color_scheme() {
  print "$INFO_LEVEL" "Installing Color Scheme..."
  print "$INFO_LEVEL" "Please, close opened iTerm instance when it's done importing the scheme..."

  COLOR_SCHEME_PATH="$TEMP_DIR/Material Design.itermcolors"
  curl --silent --location --output "$COLOR_SCHEME_PATH" "$COLOR_SCHEME_URL"
  open -W -n "$COLOR_SCHEME_PATH"
}

function install_iterm_nerd_fonts() {
  print "$INFO_LEVEL" "Installing Nerd Fonts..."
  print "$INFO_LEVEL" "Please, close opened Font Book instance when it's done importing the fonts..."

  install_font fira_code $FIRA_CODE_URL
  install_font incosolata $INCOSOLATA_URL
  install_font hack $HACK_URL
  install_font mononoki $MONONOKI_URL
  install_font meslo $MESLO_URL
}

function install_font() {
  local name=$1
  local url=$2
  local path="$TEMP_DIR/$name.ttf"

  if test -f "$HOME/Library/Fonts/$name.ttf"; then
    print "$SUCCESS_LEVEL" "Font $name already installed, skipping..."
  else
    printf "$HOME/Library/Fonts/$name.ttf Doesn't exist"
    printf "Downloading %s.\n" "$name"
    curl --progress-bar -Lo "$path" "$url?raw=true"
    open -W -n "$path"
  fi
}

function install_fish_shell() {
  if which fish &>/dev/null; then
    print "$SUCCESS_LEVEL" "Fish Shell already installed, skipping..."
  else
    print "$INFO_LEVEL" "Installing Fish Shell..."

    brew install fish
    command -v fish | sudo tee -a /etc/shells
    chsh -s "$(command -v fish)"
  fi
}

function install_fisher_and_plugins() {
  print "$INFO_LEVEL" "Installing Fisher + Plugins and post-processing installation..."

  fish install_plugins.sh
}

function install_formulaes_and_casks() {
  print "$INFO_LEVEL" "Brewing Formulaes + Casks ..."

  fish brew_apps.sh
}

function print_post_installation() {
  print "$SUCCESS_LEVEL" "                 "
  print "$SUCCESS_LEVEL" "!!! IMPORTANT !!!"
  print "$SUCCESS_LEVEL" "                 "

  print "$SUCCESS_LEVEL" "The script accomplished all the commands it was told to do"
  print "$SUCCESS_LEVEL" "Unfortunately, some things can’t be automated and you need to do them manually"
  print "$SUCCESS_LEVEL" " "
  print "$SUCCESS_LEVEL" "1) Open iTerm -> Preferences -> Profiles -> Colors -> Color Presets and apply Material Design preset"
  print "$SUCCESS_LEVEL" "2) Open iTerm -> Preferences -> Profiles -> Text -> Font and apply FiraCode Nerd Font with ligatures checkbox ticked"
  print "$SUCCESS_LEVEL" "3) Open iTerm -> Preferences -> Profiles -> Text -> Use a different font for non-ASCII text and apply FiraCode Nerd Font with ligatures checkbox ticked"
  print "$SUCCESS_LEVEL" "4) run 'tide configure' to configure your prompt "
  print "$SUCCESS_LEVEL" "5) run git config --global sequence.editor interactive-rebase-tool "
}

print_banner

install_command_line_tools
install_homebrew
install_iterm
install_iterm_color_scheme
install_iterm_nerd_fonts
install_formulaes_and_casks
install_fish_shell
install_fisher_and_plugins

print_post_installation
