# URLOpen.nvim

Open URLs in your browser straight from your buffer

## Features

In a neovim session, hover your cursor over a URL and type

```
:URLOpen
```

If the URL is valid, you'll be navigated to your browser where it will be opened.

## Installation

[Lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
  {
    "kristoferfannar/urlopen.nvim",
    config = function()
      require"urlopen"
    end
  },
```
