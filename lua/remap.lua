local nnoremap = require("keymap").nnoremap

nnoremap("<leader>v", "<cmd>:NvimTreeFocus<cr>")
nnoremap("<leader>b", "<cmd>:NvimTreeToggle<cr>")
nnoremap("<C-s>", "<cmd>w<cr>")
nnoremap("<leader>d", "<plug>(easymotion-bd-f)")
nnoremap("<leader>d", "<plug>(easymotion-overwin-f")
nnoremap("<leader>gg", "<cmd>LazyGit<cr>")
nnoremap("<leader>n", "<cmd>FloatermToggle<cr>")
nnoremap("<leader>xx", "<cmd>LspTroubleToggle<cr>")

vim.api.nvim_set_keymap("i", "jj", "<C-\\><C-n><cmd>FloatermToggle<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>cic", "<Plug>kommentary_line_increase", {})
vim.api.nvim_set_keymap("n", "<leader>ci", "<Plug>kommentary_motion_increase", {})
vim.api.nvim_set_keymap("x", "<leader>ci", "<Plug>kommentary_visual_increase", {})
vim.api.nvim_set_keymap("n", "<leader>cdc", "<Plug>kommentary_line_decrease", {})
vim.api.nvim_set_keymap("n", "<leader>cd", "<Plug>kommentary_motion_decrease", {})
vim.api.nvim_set_keymap("x", "<leader>cd", "<Plug>kommentary_visual_decrease", {})

