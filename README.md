<div align="center">

# Harpoon
##### Getting you where you want with the fewest keystrokes.

## ⇁ Installation
```
* install using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "13janderson/harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup {
        settings = {
          save_on_toggle = true,
          save_on_ui_close = true,
          tmux_autoclose_windows = false,
        },
      }
      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      -- Pseudo arrow keys for config
      vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-b>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-m>", function() harpoon:list():select(4) end)
}
```


# Additions in this fork
1. A constant floating window into the harpoon list which behaves as so:
- The floating window is loaded on neovim startup, **AFTER** harpoon is loaded. 
- Floating window is anchored to the current window and is resized when that window is resized.
- Updates to harpoon list are reflected in floating window by hooking into harpoon events.
- Floating window is **NEVER** open at the same time as harpoon's menu window.
- Floating window will not appear **EVER** again for the current session after the user forcefully closes it.
- Floating window will not appear if there are no entries in the harpoon list, as to not waste screen space.

2. Fixes a bug with where harpoon would not read the latest data properly on the current directory being changed... this functionality was
pertinent for a proper workflow with git-worktree.nvim, of which I also have my own fork: [here](https://github.com/13janderson/git-worktree.nvim) 


... Maybe more to come if I need anything else


