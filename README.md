## Installation

* clone repo to `~/.dotfiles` folder:

```
cd ~
https://github.com/aadshalshihry/dotfiles-1.git
```

* Add Vundlevim to .vim
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

* Add .rbenv [https://codeyarns.com/2015/02/12/how-to-install-rbenv/]
```
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
```

* create symbolic links to config files

```
ln -s .dotfiles/vimrc .vimrc
ln -s .dotfiles/zshrc-oh-my-zsh .zshrc
ln -s .dotfiles/vim .vim
ln -s .dotfiles/gitconfig .gitconfig
ln -s .dotfiles/gemrc .gemrc
ln -s .dotfiles/emacs .emacs.d
```

* Remap Caps_Lock to Crtl & Esc (Only for Linux)
```
setxkbmap -option 'caps:ctrl_modifier'
# xcape -e 'Caps_Lock=Escape'
xmodmap -e 'keycode 66=Escape'
```
* Fix .zshrc:1: command not found: rbenv
```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
```

