vim.opt.autochdir = true
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.format_on_save = true
vim.scrolloff = 10
vim.conceallevel = 0
vim.g.vim_json_conceal = 0
vim.g.markdown_syntax_conceal = 0

--floaterm
vim.g.floaterm_shell = "pwsh.exe"

-- bracey
vim.g.bracey_server_log = "C:/Users/stapl/tmp/bracey.log"

-- lazy git
vim.g.lazygit_floating_window_winblend = 0 --transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 --scaling factor for floating window
-- vim.g.lazygit_floating_window_corner_chars = ["╭", "╮", "╰", "╯"] --customize lazygit popup window corner characters
vim.g.lazygit_floating_window_use_plenary = 0 --use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 --fallback to 0 if neovim-remote is not installed

vim.opt.termguicolors = true
require("bufferline").setup{}
require("lualine").setup()
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    side = "right",
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = { "^.git$" },
  },
})
require("trouble").setup{}
require("toggleterm").setup{
    shell = "pwsh"
}

