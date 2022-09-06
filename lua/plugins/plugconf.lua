require("bufferline").setup({
    options = {
        buffer_close_icon = "",
        close_icon = "",
        -- indicator_icon = " ",
        left_trunc_marker = "",
        modified_icon = "●",
        offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
        right_mouse_command = "Bdelete! %d",
        right_trunc_marker = "",
        show_close_icon = false,
        show_tab_indicators = true,
    },
    highlights = {
        fill = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        background = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
        },
        buffer_visible = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        buffer_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        separator = {
            fg = { attribute = "bg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
        },
        separator_selected = {
            fg = { attribute = "fg", highlight = "Special" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        separator_visible = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        close_button = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
        },
        close_button_selected = {
            fg = { attribute = "fg", highlight = "normal" },
            bg = { attribute = "bg", highlight = "normal" },
        },
        close_button_visible = {
            fg = { attribute = "fg", highlight = "normal" },
            bg = { attribute = "bg", highlight = "normal" },
        },
    },
})

require("lualine").setup({
    options = {
        theme = "vscode"
    }
})

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
        dotfiles = true,
        custom = { "^.git$" },
    },
})
require("trouble").setup{}
require("toggleterm").setup{
    shell = "pwsh"
}

require("mason").setup()
require("mason-lspconfig").setup()

local rt = {
    server = {
        settings = {
            on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                require "illuminate".on_attach(client)
            end,
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "cargo clippy"
                }, 
            },
        }
    },
}
require("rust-tools").setup(rt)

-- LSP Diagnostics Options Setup 
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ""
    })
end

sign({name = "DiagnosticSignError", text = ""})
sign({name = "DiagnosticSignWarn", text = ""})
sign({name = "DiagnosticSignHint", text = ""})
sign({name = "DiagnosticSignInfo", text = ""})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})



-- Completion Plugin Setup
local cmp = require("cmp")
cmp.setup({
    -- Enable LSP snippets
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- Add tab support
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-y>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
        })
    },
    -- Installed sources:
    sources = {
        { name = "path" },                              -- file paths
        { name = "nvim_lsp", keyword_length = 3 },      -- from language server
        { name = "nvim_lsp_signature_help"},            -- display function signatures with current parameter emphasized
        { name = "nvim_lua", keyword_length = 2},       -- complete neovim"s Lua runtime API such vim.lsp.*
        { name = "buffer", keyword_length = 2 },        -- source current buffer
        { name = "vsnip", keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
        { name = "calc"},                               -- source for math calculation
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {"menu", "abbr", "kind"},
        format = function(entry, item)
            local menu_icon ={
                nvim_lsp = "λ",
                vsnip = "⋗",
                buffer = "Ω",
                path = "🖫",
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})

-- Treesitter Plugin Setup 
require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "rust", "toml", "c" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting=false,
    },
    ident = { enable = true }, 
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
})

-- indent-blankline.nvim
vim.opt.termguicolors = true
-- vim.cmd [[highlight IndentBlanklineIndent1 bg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 bg=#1a1a1a gui=nocombine]]
require("indent_blankline").setup({
    char = "",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    show_trailing_blankline_indent = true,
})

-- vscode colorscheme
local c = require("vscode.colors")
require("vscode").setup({
    -- Enable transparent background
    transparent = false,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = "#A3A3A3",
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})

require('lspconfig').tsserver.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require('lspconfig').clangd.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require('lspconfig').rust_analyzer.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

-- local lspconfig = require("lspconfig")
--[[ lspconfig.ccls.setup({
    init_options = {
        compilationDatabaseDirectory = "C:/Users/stapl/workspace/omnicom-c";
        index = {
            threads = 8;
        };
        clang = {
            excludeArgs = { "-target" } ;
            extraArgs = { "--gcc-toolchain='C:/msys64/mingw64/lib'" };
        };
    }
}) ]]
-- lspconfig.clangd.setup({})
--[[ local util = require("lspconfig.util")
lspconfig.clangd.setup({
    cmd = {
        "clangd",
        "--background-index",
        "--query-driver='C:/msys64/mingw64/bin,C:/msys64/mingw64/lib,C:/Users/stapl/workspace/gstreamer-1.20.2/1.0/mingw_x86_64/lib,C:/Users/stapl/workspace/omnicom-c/ext/orc-0.4/lib'"
    },
    
    root_dir = util.root_pattern("compile_commands.json", ".git"),
}) ]]

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

