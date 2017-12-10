# iTerm 2 + Fish Shell + Oh My Fish + Themes\Plugins

This guide is targeted for those, who wants to have a nice UI in the terminal with the rich features.

## The Problem

Every time, I've re-installed my operating system, I spend around ~30 minutes to set up my terminal environment again.
I bored of it, so I decided to make a list of all actions I doing, when setting it up, alongside with automatic script to do so, and share it with you all.

## How To Setup

You can achieve the same setup as mine, by manually setting up the environment ([following the guide](#manual-installation) below) or automatically [by executing the installer](#automatic-installation) `install.sh`.

## Key Features

- Material design theme with dark-soft colors
- Nerd fonts (Powerline patched font)
- Fish shell with installed Oh My Fish framework
- Theme `bobthefish` which is based on `agnoster`
- A lot of plugins for simplifying your daily routine: generating LICENSE file; completion for git flow, brew, node_modules, etc; plugin for jumping between your project folders via one command; etc... (for a full list of plugins refer [here](#install-plugins))

## Automatic Installation

_TODO: find a way to install iTerm2 with patched fonts through CLI_

Though, it can not be called "fully automatic", since iTerm installation is still must be proceed manually.

So, before calling this shell script, you need to install [iTerm 2](#iterm2) with its color scheme and patched font.
Afterwards, you can call this script in your iTerm instance.

```shell
curl https://raw.githubusercontent.com/ghaiklor/iterm-fish-omf-osx/master/install.sh | bash
```

## Manual Installation

### iTerm2

#### Install iTerm 2

- [Download](http://www.iterm2.com/downloads.html) and install iTerm2 (it has better color fidelity than the built in Terminal).

#### Install Color Scheme

Get the iTerm color settings:

- [Material Design Theme](https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors)
- [More themes @ iterm2colorschemes](http://iterm2colorschemes.com/)

Just save it somewhere and open the file(s).
The color settings will be imported into iTerm2.
Apply them in iTerm through iTerm -> Preferences -> Profiles -> Colors -> Load Presets.
You can create a different profile, other than Default if you wish to do so.

#### Install Patched Font

- [Meslo M-DZ Mono](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Meslo/M-DZ/complete/Meslo%20LG%20M%20DZ%20Regular%20Nerd%20Font%20Complete%20Mono.otf)
- [Others @ powerline fonts](https://github.com/ryanoasis/nerd-fonts)
    
Open the downloaded font and press "Install Font".

Set this font in iTerm2 (iTerm -> Preferences -> Profiles -> Text).

- Regular Font -> "Change Font"
- Non-ASCII Font -> "Change Font"

Restart iTerm2 for all changes to take effect.

### Fish Shell

#### Install Fish Shell

Download and install [Fish Shell](https://fishshell.com).

Change default shell to fish:

```shell
$ echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
$ chsh -s /usr/local/bin/fish
```

#### Install Oh My Fish

```shell
$ curl -L https://get.oh-my.fish | fish
```

__If something goes wrong call `omf doctor`__.

#### Install Themes\Plugins

```shell
$ brew install jq grc thefuck
$ omf install spark license battery git-flow await hash errno brew node-binpath grc pj thefuck theme
$ set -gx PROJECT_PATHS ~/Library/Projects
$ theme --download-all
$ theme bobthefish
```

- [Spark](https://github.com/oh-my-fish/plugin-spark)

Sparklines for your shell.
More documentation is available [here](https://github.com/holman/spark).
For instance, you can use it to quickly build a sparkline for Git commits by author `git shortlog -s | cut -f1 | spark`.

- [License](https://github.com/oh-my-fish/plugin-license)

Fish Shell plugin for generating github licenses.
As an external dependency it requires `jq` to be installed.

- [Battery](https://github.com/oh-my-fish/plugin-battery)

Display battery slots in your terminal by calling `battery`.

- [GitFlow](https://github.com/oh-my-fish/plugin-git-flow)

Completion support for git-flow.
The contained completion routines provide support for completing git-flow `init` and `version`, feature, hotfix and release branches.

- [Await](https://github.com/oh-my-fish/plugin-await)

Wait last background job with a nice progress spinner.
`sleep 10 & await`, `git pull origin master & await`, etc...

- [Hash](https://github.com/oh-my-fish/plugin-hash)

Computes string digests using various hashing algorithms.
`hash md5 "Hello World!"`, `cat myfile.txt | hash md5`...

- [ErrNo](https://github.com/oh-my-fish/plugin-errno)

Translate error codes to return status codes or lookup them by message strings.
It has completions, so you can easily navigate through `errno` and `strerror`.

- [Brew](https://github.com/oh-my-fish/plugin-brew)

Oh My Fish plugin to integrate Homebrew paths into shell.

- [Node BinPath](https://github.com/oh-my-fish/plugin-node-binpath)

Automatically add `node_modules/.bin` to PATH when present.
Useful, when you don't want to have globally installed npm packages, but has local installments in your project.
It allows to call, i.e. `mocha` as it was installed globally, but from your current project folder.

- [GRC](https://github.com/oh-my-fish/plugin-grc)

A grc plugin plugin for Oh My Fish which colorized output of many default commands like `ls`, `netstat`, etc...
It uses an external dependency `grc`, which must be installed.

- [PJ](https://github.com/oh-my-fish/plugin-pj)

PJ allows you to easily jump between your favourite directories in a predictable manner.
You tell pj where to look for your projects, and it will allow you to jump to them easily with tab completion.
It even provides a convenient ability to open an editor in that directory from anywhere!

- [The Fuck](https://github.com/oh-my-fish/plugin-thefuck)

This plug-in creates the necessary function to be used with [The Fuck](https://github.com/nvbn/thefuck).

- [Theme](https://github.com/oh-my-fish/plugin-theme)

Quick theme switcher for Oh My Fish.
`theme` is smart to auto-complete as you type all the available oh-my-fish themes.

## License

[MIT](./LICENSE)
