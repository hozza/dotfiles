# dotfiles

☔️ __Here be Dragons...__ and a simplified version of my most used dots.

 - Shell agnostic.
 - Native and clean as possible.
 - [Cascadia Code Font](https://github.com/microsoft/cascadia-code)
 - Swapped a super-fancy vim IDE setup to VS Code and a configured nano.
 - [1Password SSH key agent](https://developer.1password.com/docs/ssh/agent/) and 6-key workaround included.


*Checkout my older maximalist dot versions in the archive folder. Load of stuff like i3-wm etc. Nowadays, I'm using Linux Mint Cinnamon, VS Code, Gnome Terminal and Tmux.*

# TODO

- make install script for dotfiles

# Install & Usage

I use these `~/.dotfiles` configs across cloud and local platforms (with a non-git non-public repo for all the private or per-machine tweaks under `~/.dotfiles_private`).

This `~/.dotfiles` repo is structured like a mirror of your $HOME directory, but only with config files.

	i.e. Files directly in the repo can by copied/symbolic-linked directly to your home directory, and files within sub-directories in the repo should be within those subdirectories under your home dir too. 

	e.g. `dotfiles/.myConf` goes in `~/.myConf` and `dotfiles/.config/myOtherConf` goes in `~/.config/myOtherConf`.

Just add `source ~/.shell-mods.sh` into your shellrc e.g. `~/.bashrc` or `~/.zshrc`. If you want to change the prompt user@hostname color add `PROMPT_HOST_COLOR="\[\033[38;5;048m\]"` before you source the shell-mods.sh file and change the "048" to [whatever color you like](https://unix.stackexchange.com/a/124409).