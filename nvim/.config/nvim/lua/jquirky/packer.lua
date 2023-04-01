-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
 
    -- Themes
    use { "ajmwagar/vim-deus"}
    use { "rmehri01/onenord.nvim"}
    use { "catppuccin/nvim", as = "catppuccin" }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('onsails/lspkind.nvim')
    use('j-hui/fidget.nvim')
    use('terrortylor/nvim-comment')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use "lukas-reineke/indent-blankline.nvim"

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-cmdline'},
            {'hrsh7th/nvim-cmp'},

            {'hrsh7th/cmp-nvim-lua'},
            {'saadparwaiz1/cmp_luasnip'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }


end)
