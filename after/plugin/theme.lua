vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.opt.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

require("bufferline").setup{}
require("lualine").setup()
require("nvim-tree").setup({
    sort_by = "case",
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

-- indentLine
vim.g.indentLine_setConceal = 0
vim.g.indentLine_color_gui = "#A4E57E"


