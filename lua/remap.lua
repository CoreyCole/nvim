local nnoremap = require("keymap").nnoremap

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    close_on_exit = true,
    direction = 'float',
    float_ops = {
        winblend = 3,
    }
})

function _lazygit_toggle()
  lazygit:toggle()
end

nnoremap("<leader>v", "<cmd>:NvimTreeFocus<cr>")
nnoremap("<leader>b", "<cmd>:NvimTreeToggle<cr>")
nnoremap("<C-s>", "<cmd>w<cr>")
nnoremap("<leader>d", "<plug>(easymotion-bd-f)")
nnoremap("<leader>d", "<plug>(easymotion-overwin-f")
nnoremap("<leader>g", _lazygit_toggle)
nnoremap("<leader>n", "<cmd>ToggleTerm<cr>")
nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>")
nnoremap("<leader>zz", "<plug>(coc-diagnostic-info)")
nnoremap("<leader>h", "<cmd>:CocCommand clangd.switchSourceHeader<cr>")
nnoremap("<C-LeftMouse>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), 'x', true)
    vim.fn.feedkeys("gd")
end)

vim.api.nvim_set_keymap("i", "jj", "<C-\\><C-n><cmd>FloatermToggle<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>cic", "<Plug>kommentary_line_increase", {})
vim.api.nvim_set_keymap("n", "<leader>ci", "<Plug>kommentary_motion_increase", {})
vim.api.nvim_set_keymap("x", "<leader>ci", "<Plug>kommentary_visual_increase", {})
vim.api.nvim_set_keymap("n", "<leader>cdc", "<Plug>kommentary_line_decrease", {})
vim.api.nvim_set_keymap("n", "<leader>cd", "<Plug>kommentary_motion_decrease", {})
vim.api.nvim_set_keymap("x", "<leader>cd", "<Plug>kommentary_visual_decrease", {})

