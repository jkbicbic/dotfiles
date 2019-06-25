# Personal Dotfile

First is to install brew

```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

then clone this and cd to where you put the `dotfiles` and run brew to install the essential tools and apps

```
$ brew.sh
```

### Apps that will be installed by brew

The list of apps that will be installed is inside `cask.sh`

```
* Slack --- Chat tool
* Sequel Pro --- mySql database tool
* Chrome --- Browser
* Android Transfer --- MacOs to Android Transfer
* Transmission --- Torrent Downloader
```

## Vim

Vim will be installed by brew but it's plugin should be installed by going in vim

```
$ vi
```

enter this command in the keyboard

```
:PlugInstall
```

### Vim aliases

### Go vim highlighter and autoimporter

This settings will highlight all functions and autoimports unimported modules when saving. To use this, access your `vimrc` by

```
$ vi ~/.vimrc
```

and add the following

```
" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_snippet_engine = "neosnippet"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

```

## GoPls

Installing GoPls Intellesense requires enter this command in the keyboard while inside vim

```
:CocConfig
```

then paste this

```
{
 "languageserver": {
  "golang": {
   "command": "gopls",
   "rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/"],
   "filetypes": ["go"]
  }
 }
}
```

and enter this final command

```
:CocInstall coc-json
```

for more indepth instructions go to [coc-nvim](https://github.com/neoclide/coc.nvim/wiki/Language-servers#go) by [neoclide](https://github.com/neoclide)

## Credits

This dotfiles is derived from [Mathias Bynens](https://github.com/mathiasbynens)'s [dotfiles](https://github.com/mathiasbynens/dotfiles) check him out :+1:
