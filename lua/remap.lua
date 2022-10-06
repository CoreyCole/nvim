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
local cargo_run_term = Terminal:new({
    cmd = "cargo run",
    close_on_exit = false,
    direction = 'float',
    float_ops = {
        winblend = 3,
    }
})
local cargo_check_term = Terminal:new({
    cmd = "cargo check",
    close_on_exit = false,
    direction = 'float',
    float_ops = {
        winblend = 3,
    }
})
local cargo_test_term = Terminal:new({
    cmd = "cargo test",
    close_on_exit = false,
    direction = 'float',
    float_ops = {
        winblend = 3,
    }
})

function _lazygit_toggle()
    lazygit:toggle()
end
function _cargo_run_toggle()
    cargo_run_term:toggle()
end
function _cargo_check_toggle()
    cargo_check_term:toggle()
end
function _cargo_test_toggle()
    cargo_test_term:toggle()
end
local toggled_types = false;
function _toggle_types()
    if(toggled_types)
    then
        toggled_types = false
        require('rust-tools').inlay_hints.disable() 
    else
        toggled_types = true
        require('rust-tools').inlay_hints.enable()
        vim.cmd("hi def IlluminatedWordText gui=underline")
        vim.cmd("hi def IlluminatedWordRead gui=underline")
        vim.cmd("hi def IlluminatedWordWrite gui=underline")
    end
end

nnoremap("<leader>a", "<cmd>:BufferLinePick<cr>")
nnoremap("<leader>v", "<cmd>:NvimTreeFocus<cr>")
nnoremap("<leader>b", "<cmd>:NvimTreeToggle<cr>")
nnoremap("<C-s>", "<cmd>w<cr>")
--[[ nnoremap("<leader>d", "<plug>(easymotion-bd-f)")
nnoremap("<leader>d", "<plug>(easymotion-overwin-f") ]]
nnoremap("<leader>h", "<cmd>:ClangdSwitchSourceHeader<cr>")
nnoremap("<leader>g", _lazygit_toggle)
nnoremap("<leader>gr", _cargo_run_toggle)
nnoremap("<leader>gc", _cargo_check_toggle)
nnoremap("<leader>gt", _cargo_test_toggle)
nnoremap("<leader>n", "<cmd>ToggleTerm<cr>")
nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>")
nnoremap("<leader>t", _toggle_types)
nnoremap("<leader>sd", function()
    vim.lsp.buf.hover()
end)
nnoremap("<leader>gd", function()
    vim.lsp.buf.definition()
end)
nnoremap("<C-LeftMouse>", function()
    vim.lsp.buf.definition()
end)
nnoremap("<leader>d", "<C-O>") 
nnoremap("<A-LeftMouse>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), 'x', true)
    vim.fn.feedkeys("gf")
end)

vim.api.nvim_set_keymap("i", "jj", "<C-\\><C-n><cmd>FloatermToggle<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>cic", "<Plug>kommentary_line_increase", {})
vim.api.nvim_set_keymap("n", "<leader>ci", "<Plug>kommentary_motion_increase", {})
vim.api.nvim_set_keymap("x", "<leader>ci", "<Plug>kommentary_visual_increase", {})
vim.api.nvim_set_keymap("n", "<leader>cdc", "<Plug>kommentary_line_decrease", {})
vim.api.nvim_set_keymap("n", "<leader>cd", "<Plug>kommentary_motion_decrease", {})
vim.api.nvim_set_keymap("x", "<leader>cd", "<Plug>kommentary_visual_decrease", {})

