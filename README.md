# Personal Dotfile

First is to install brew

```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

then clone this and cd to where you put the `dotfiles` and run brew to install the essential tools and apps

```
$ brew.sh
```

## Vim

Vim will be installed by brew but it's plugin should be installed by going in vim

```
$ vi
```

type this command in the keyboard

```
:PlugInstall
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
