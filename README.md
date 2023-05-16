# dotfiles

☔️ __Here be Dragons...__ and a simplified version of my most used dots.

*Checkout the older i3-wm maximalist dot versions in the archive folder. Nowadays, I'm just using Linux Mint Cinnamon, VS Code, Gnome Terminal and Tmux.*

 - Bash/Zsh agnostic. I use bash in the cloud, zsh on the metal.
 - Native and clean as possible.
 - Cascadia Code Font
 - Swapped a super-fancy vim IDE setup to VS Code and a configured nano.

# Install & Usage

I use these `~/dotfile` configs across cloud and local platforms (with a non-git non-public repo for all the private or per-machine tweaks under `~/.dotfiles_private`).

This `~/dotfiles` repo is structured like a mirror of your $HOME directory, but only with config files.

	i.e. Files directly in the repo can by copied/symbolic-linked directly to your home directory, and files within sub-directories in the repo should be within those subdirectories under your home dir too. 

	e.g. `dotfiles/.myConf` goes in `~/.myConf` and `dotfiles/.config/myOtherConf` goes in `~/.config/myOtherConf`.