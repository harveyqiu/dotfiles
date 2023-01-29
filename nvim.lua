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
    "ggandor/leap.nvim",
    "ybian/smartim",
    "lukas-reineke/indent-blankline.nvim",
})

require('leap').add_default_mappings()
vim.g.smartim_default = "com.apple.keylayout.ABC"

require("indent_blankline").setup()

vim.opt.list = true

