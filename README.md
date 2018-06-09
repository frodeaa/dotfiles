# Dotfiles

Manage all dotfiles without symlinking

## Installation

    git clone --bare git@github.com:frodeaa/dotfiles.git ~/.cfg

    # configure config alias for managing the repo
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

    config checkout
    config submodule init
    config submodule update

    # ignore untracked files
    config config --local status.showUntrackedFiles no

    # create a new session to active
    exit

## Configurations

Configures sync of gmail using offlineimap. gmail secrets are
managed by pass

    $ pass user@domain.com
    ├── client_id
    ├── client_secret
    ├── msmtp_password
    └── refresh_token

Use [create an app password](https://myaccount.google.com/apppasswords)
to create the `msmtp_password`

### Register OAuth2 client for Gmail

Go to the [Gmail API overview console](https://console.developers.google.com/apis/api/gmail.googleapis.com/overview)
and create a new project. Create new Credentials, with `Gmail API` as
type and create an client id for the credentials.

 - notmuch is used for search
 - contacts is used to enable system address book

### Vim Packages

Packages installed from submodules

 - [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim): Run Async Shell Commands in Vim 8.0 and Output to Quickfix Window.
 - [ctrlp.vim](https://github.com/kien/ctrlp.vim): Fuzzy file, buffer, mru, tag, etc finder.
 - [python-mode](https://github.com/python-mode/python-mode): Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
 - [tsuquyomi](https://github.com/Quramy/tsuquyomi): A Vim plugin for TypeScript
 - [typescript-vim](https://github.com/leafgarland/typescript-vim): Typescript syntax files for Vim
 - [vim-go](https://github.com/fatih/vim-go): Go development plugin for Vim https://patreon.com/fatih.
 - [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized): precision colorscheme for the vim text editor.
 - [vim-fugitive](https://github.com/tpope/vim-fugitive): a Git wrapper so awesome, it should be illegal.
 - [vim-go](https://github.com/fatih/vim-go): Go development plugin for Vim https://patreon.com/fatih.
 - [vim-javascript](https://github.com/pangloss/vim-javascript): Vastly improved Javascript indentation and syntax support in Vim.
 - [vim-js-indent](https://github.com/jason0x43/vim-js-indent): Vim indenter for standalone and embedded JavaScript
 - [vim-jsx](https://github.com/mxw/vim-jsx): React JSX syntax highlighting and indenting for vim.
 - [vimux](https://github.com/benmills/vimux): vim plugin to interact with tmux

### Tmux

Install Tmux with brew and use use tmp plugin to install
all other plugins

    brew install tmux reattach-to-user-namespace

## brew list

installed formulae.

 - contacts
 - cpanm
 - diff-so-fancy
 - git
 - hh
 - msmtp
 - mutt
 - notmuch
 - offlineimap
 - openttd
 - pass
 - perl
 - reattach-to-user-namespace
 - the_silver_searcher
 - tmux
 - tree
 - typescript
 - urlview
 - w3m
