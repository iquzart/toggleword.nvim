<h1 align="center">
 toggleword.nvim
</h1>

<p align="center">
A minimal Neovim plugin to toggle boolean-like words under your cursor.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/built%20with-neovim%20lua-blue.svg?style=flat-square" />
  <img src="https://img.shields.io/github/license/iquzart/toggleword.nvim?style=flat-square" />
  <img src="https://github.com/iquzart/toggleword.nvim/actions/workflows/test.yml/badge.svg" />
</p>

## Features

- Toggle common values like `true` ⇄ `false`, `on` ⇄ `off`, etc.
- Minimal, fast, and Lua-native.
- Configurable keybinding.
- Custom toggle pairs supported.

## Installation

### Lazy.nvim:

```lua
{
  "iquzart/toggleword.nvim",
   opts = {
     key = "<leader>tt" -- optional, defaults to <leader>tt,
   }
}
```

### packer.nvim:

```lua
use {
  "yourname/toggleword.nvim",
  config = function()
    require("toggleword").setup()
  end,
}
```

### Supported words

```
- true ⇄ false
- on ⇄ off
- enabled ⇄ disabled
- yes ⇄ no
- up ⇄ down
- start ⇄ stop
- open ⇄ close
- allow ⇄ deny
- accept ⇄ reject
- read ⇄ write
- push ⇄ pull
- inbound ⇄ outbound
- public ⇄ private
- online ⇄ offline
- local ⇄ remote
- master ⇄ slave
- primary ⇄ replica
- active ⇄ passive
- manual ⇄ automatic

- prod ⇄ uat ⇄ dev ⇄ preprod (cyclical)
```

### Custom Toggle Pairs

You can override the default list:

```lua
require("toggleword").setup {
  key = "<leader>tw",
  toggle_groups = {
    {"start", "stop"},
    {"open",  "close"},
    {"active", "inactive"},
  }
}
```

### Usage

```
Place your cursor on a supported word and press <leader>tt.
If the word matches a toggle pair, it will be replaced with the opposite.
```
