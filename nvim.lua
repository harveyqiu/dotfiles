vim.o.number = true
vim.o.relativenumber = false

vim.o.smarttab = true
vim.o.expandtab = true
vim.o.autoident = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

local function set_keymap(...) vim.api.nvim_set_keymap(...) end
local opts = {noremap = true, silent = true}

for _, mode in pairs {"n", "v"} do
    set_keymap(mode, "J", "G", opts)
    set_keymap(mode, "K", "gg", opts)
    set_keymap(mode, "H", "^", opts)
    set_keymap(mode, "L", "$", opts)
end

set_keymap("i", "<C-c>", "<esc>", opts)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "nordtheme/vim",
    "ggandor/leap.nvim",
    "ybian/smartim",
    "lukas-reineke/indent-blankline.nvim",
    "nvim-tree/nvim-tree.lua",
    {
      "nvim-telescope/telescope.nvim", tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    "godlygeek/tabular",
    "preservim/vim-markdown",
    {
      "nvim-treesitter/nvim-treesitter",
      build =  ":TSUpdate"
    },
    "epwalsh/obsidian.nvim",
    "hrsh7th/nvim-cmp",
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
})

require('leap').add_default_mappings()
vim.g.smartim_default = "com.apple.keylayout.ABC"

require("indent_blankline").setup()

vim.opt.list = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 20,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require("telescope").setup({
  defaults = {
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
  },
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.cmd [[colorscheme nord]]

require('cmp').setup({
  sources = {
    { name = 'nvim_lua' }
  }
})

require("obsidian").setup({})
require("which-key").setup({})

