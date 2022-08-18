return require("packer").startup(function()
    use "wbthomason/packer.nvim" --packer can manage itself
  
    --vim ux
    use "psliwka/vim-smoothie" --smooth scrolling
    use "junegunn/fzf"
    use "junegunn/fzf.vim" --fuzzy find search
    use "jdhao/better-escape.vim"
    use "Yggdroot/indentLine" --line for indents 
    use "lukas-reineke/indent-blankline.nvim" --show indents
    use "easymotion/vim-easymotion" --cursor movement
    use "norcalli/nvim-colorizer.lua" --hex color render
    use "ellisonleao/gruvbox.nvim" --theme
    use "folke/tokyonight.nvim" --theme
    use "folke/lsp-colors.nvim"
    use "tpope/vim-surround" --change surrounding parens, brackets, quotes, etc.

    --rust
    use "rust-lang/rust.vim" --rust support

    --comments
    use "b3nj5m1n/kommentary" --comments
    use "preservim/nerdcommenter" --comments
    use "kkoomen/vim-doge" --doc comments
 
    --vscode like
    use "neovim/nvim-lspconfig" -- Configurations for Nvim LSP
    use "neoclide/coc.nvim" --vscode like suggestions/autocomplete/autoimport
    use "kyazdani42/nvim-tree.lua" --file tree window
    use "nvim-lualine/lualine.nvim" --status line
    use {
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        requires = "kyazdani42/nvim-web-devicons"
    } 
    use { --vscode like lint issues, etc.
       "arafatamim/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use {"akinsho/toggleterm.nvim", tag = "v2.*", config = function()
        require("toggleterm").setup()
    end}
end)

