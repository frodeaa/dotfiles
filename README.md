# Dotfiles

## Vim Configuration

Requires Vim 8 (support for packages)

### Installation

    git clone git@github.com:frodeaa/dotfiles.git ~/.dotfiles

Create symlink:

    ln -s ~/.dotfiles/vimrc ~/.vimrc
    ln -s ~/.dotfiles/vim ~/.vim

Checkout plugins:

    cd ~/.vim
    git submodule init
    git submodule update


### Packages

Packages installed from submodules

 - [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim): Run Async Shell Commands in Vim 8.0 and Output to Quickfix Window.
 - [ctrlp.vim](https://github.com/kien/ctrlp.vim): Fuzzy file, buffer, mru, tag, etc finder.
 - [python-mode](https://github.com/python-mode/python-mode): Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
 - [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized): precision colorscheme for the vim text editor.
 - [vim-fugitive](https://github.com/tpope/vim-fugitive): a Git wrapper so awesome, it should be illegal.
 - [vim-javascript](https://github.com/pangloss/vim-javascript): Vastly improved Javascript indentation and syntax support in Vim.
 - [vim-jsx](https://github.com/mxw/vim-jsx): React JSX syntax highlighting and indenting for vim.
 - [vim-go](https://github.com/fatih/vim-go): Go development plugin for Vim https://patreon.com/fatih.
 - [vimux](https://github.com/benmills/vimux): vim plugin to interact with tmux

## Tmux

    brew install tmux reattach-to-user-namespace

    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

    # install Tmux plugin manager
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
