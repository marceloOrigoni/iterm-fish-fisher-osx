#!/usr/bin/env fish
#title         :install_plugins.sh
#description   :This script will install and configure themes and plugins for Fish Shell
#author        :ghaiklor
#date          :2021-06-20
#version       :1.0
#usage         :curl --silent --location "https://github.com/ghaiklor/iterm-fish-fisher-osx/blob/master/install_plugins.sh?raw=true" | fish
#fish_version  :3.2.2
#===================================================================================

curl --silent --location https://git.io/fisher | source

fisher install jorgebucaran/fisher
fisher install edc/bass
fisher install patrickf1/colored_man_pages.fish
fisher install oh-my-fish/plugin-grc
fisher install jorgebucaran/nvm.fish
fisher install reitzig/sdkman-for-fish
fisher install nickeb96/puffer-fish
fisher install IlanCosman/tide@v5

fish_update_completions
