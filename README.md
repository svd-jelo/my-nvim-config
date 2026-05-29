# Introduction
 
This repo hosts my Neovim configuration, currently working for macOS. I am just starting out editing with Neovim -- it's cool because of Vim's insane editing capabilities, and it is highly configurable so I can customize however I want. However, it takes time to set up the plugins, having zero knowledge about Lua, LSP, and all that.

At its current version, the features in my configuration include the essential plugins (had to watch lots of tutorials just to set this up). I'm going to add more functionalities as I go. I hope to be able to operate in Neovim comfortably for my Python projects and LaTeX documents.

# Features
 
- Package management via [Lazy.nvim](https://github.com/folke/lazy.nvim)
- Colorscheme via [Catppuccin](https://github.com/catppuccin/nvim)
- Fuzzy finding and grepping via [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Telescoping Vim UI select via [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
- Highlighting and indenting via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Custom statusline via [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- File system management via [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- LSP server installation and management via [mason.nvim](https://github.com/mason-org/mason.nvim) and [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim#configuration)
- LSP server configurations via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

# Installed LSP servers
- `lua_ls` - Offers Lua language support.
- `pyright` - Static type checker for Python.

# To-do List
 
Functionalities to be added:
- [X] LSP suppport
- [ ] Markdown writing and previewing
- [ ] Python debugging
- [ ] LaTeX editing and previewing
