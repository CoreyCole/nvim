return require("packer").startup(function()
    use "wbthomason/packer.nvim" --packer can manage itself 
    --vim ux
    use "psliwka/vim-smoothie" --smooth scrolling
    -- use {"junegunn/fzf", config = function()
        -- fzf_install()
    -- end}
    use "junegunn/fzf"
    use "junegunn/fzf.vim" --fuzzy find search
    use "airblade/vim-rooter" --changes working directory
    use "jdhao/better-escape.vim"
    -- use "Yggdroot/indentLine" --line for indents
    use "lukas-reineke/indent-blankline.nvim"
    use "easymotion/vim-easymotion" --cursor movement
    use "norcalli/nvim-colorizer.lua" --hex color render
    use "ellisonleao/gruvbox.nvim" --theme
    use "folke/tokyonight.nvim" --theme
    use "Mofiqul/vscode.nvim" --theme
    use "folke/lsp-colors.nvim"
    use "tpope/vim-surround" --change surrounding parens, brackets, quotes, etc.
    -- use "sheerun/vim-polyglot" --languages that dont slow startup

    -- highlights
    use "RRethy/vim-illuminate"

    --rust
    use "rust-lang/rust.vim" --rust support

    --comments
    use "b3nj5m1n/kommentary" --comments
    use "preservim/nerdcommenter" --comments
    use "kkoomen/vim-doge" --doc comments

    -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'f3fora/cmp-spell'
    use 'hrsh7th/vim-vsnip'

    --vscode like
    --wfxr/minimap.vim
    use "neovim/nvim-lspconfig" -- Configurations for Nvim LSP
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use 'simrat39/rust-tools.nvim'
    -- use "neoclide/coc.nvim" --vscode like suggestions/autocomplete/autoimport
    -- use "dense-analysis/ale" --linting, formatting, etc.
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

