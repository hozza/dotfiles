# dotfiles
☔️ _Here be Dragons..._ and since there is no place quite like `~/`, here are the public portions of my development workspace configurations.

# What & Whys

I use these `~/dotfile` configs across my cloud and local platforms (with a non-git non-public repo for all the private or per-machine tweaks under `~/.dotfiles_private`).

_Keeping to my current distros official repositories as much as possible, unfortunately means no i3-gaps or 'dual kawase blur' from the tryone144 fork of compton._

Local _(on my metal)_ I'm running the **i3** tiling window manager, spiced with a healthy rice of **compton** (fades, transparency) and **rofi** (the dmenu replacement) etc. 

Cloud _(someone else's metal)_ Where I get most of my development work done via a mosh/SSH tunnel and **tmux**, **zsh**, **vim** etc.

## Terminal

After trying many terminal applications locally, I decided to stick with a largely unmodded `gnome-terminal` with the 'Nerd Font' patch of `Fira Code` font - unfortunately code-focused ligatures, Unicode-icons and font-icons are just not going to happen on a respectable mono-spaced Linux terminal (...for now) although you can still benefit from the bundled Nerd Font icons etc.

## Environment (.zsh* & .dircolors)

Using a fairly standard **ZSH** - extended via the popular **oh-my-zsh** (although intend to swap to pathogen inspired antigen soon), and a slightly heavier customised prompt, with welcome display and system-mail setup for cron. 

Dircolors for theming; `ls` file system navigation and NerdTree vim file-structure panel too.


## Terminal Multiplexer (.tmux.conf.local)

Built on top of the ambiguously named `.tmux` extension/pre-made-config for `tmux` from '[gpakosz/.tmux](https://github.com/gpakosz/.tmux)' - my config adds some much needed vim/tmux split constancy and theming, full terminal color correction etc.


## Editor (.vimrc)

My vim config is build to replace, and improve-upon my old _Sublime Text 3_ setup.

A tuned but simple web-development focused IDE-like setup. Rocking a modded OneDark syntax highlighting theme, super-spellchecking shortcuts, file-structure sidebar, code-structure sidebar, icons, tmux (and copy/paste) server-side integration, git and a simple language-server interface for all things lint and autocomplete for all programming languages natively installed.


## Version Control (.gitconig)

Keeping it relatively simple with a few handy shortcuts and credentials offloaded outside the dotfiles dir, with added vim and zsh prompt integration.


# install.sh

🔥 _Never blindly `git clone` and install anything, make sure you trust the source-code author or have read through the code where possible, especially for small shell scripts like this install script._

To keep everything simple, this `~/dotfiles` repo is structured like a mirror of your $HOME directory, but only with config files.

	i.e. Files directly in the repo can by copied/symbolic-linked directly to your home directory, and files within sub-directories in the repo should be within those subdirectories under your home dir too. 

	e.g. `dotfiles/.myConf` goes in `~/.myConf` and `dotfiles/.config/myOtherConf` goes in `~/.config/myOtherConf`.

**The mega easy way**, copy the config file (or section of the config file) you'd like to use and place it in the right location.

**The proper way:**

Some configs will source files from `~/dotfiles/lib` directly, keep this in mind if installing outside the recommended path.

1. In your home directory `cd ~`, clone this repo with `git clone https://github.com/hozza/dotfiles`.
2. In the dotfiles dir, make the install.sh executable with `cd ~/dotfiles && chmod u+x ./install.sh`.
3. While still in the dotfiles dir, run the installer with `./intall.sh`.

The small installer will work it's way through the configs, asking which ones would like to symbolically link (install), and it'll even backup any existing configs too.


# Private bits...

**How do you keep password and confidential or personal information out of a dotfiles repo when sharing it?** 

There are many ways under any unix-like os, like secret-managers and password-managers and somehow trying to get your dotfiles to reference them automatically, there are also some "skin-of-your-teeth" approaches that attempt to strip-out or obfuscate any sensitive info before it is committed to a public repo. 

_All of these sound like a lot of hassle to me._

I simply keep my 'secrets', like login credentials, in a separate non-public non-repo under an environment var location called `$PRIVATES` which live under `~/.dotfiles_private/` - all the configs in shown in this dotfiles repo will source or refer to this location when secrets need to be spilled. You can just keep credentials as plain-text one-use/revocable tokens rather than passwords, and you can even encrypt and decrypt this private location using a file system mechanic at login etc.

This also has the handy side-affect of allowing you to have one generic, updatable and public repository of configs and also have unique, user or machine specific private information managed separately.
