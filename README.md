## Installation

* clone repo to `~/.dotfiles` folder:

```
cd ~
git clone https://github.com/Remchi/dotfiles.git .dotfiles
```

* Add Vundlevim to .vim
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

* Add .rbenv [https://codeyarns.com/2015/02/12/how-to-install-rbenv/]
```
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

