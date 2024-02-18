if vim.g.vscode then
    -- VSCode config
    vim.cmd[[source $HOME/.config/nvim/vscode.vim]]
--    require("vscode")
else
    -- ordinary Neovim
	require("industriousrebel")
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
	local plugins = {
	    {
		"rebelot/kanagawa.nvim",
		as = 'kanagawa',
		config = function()
		    vim.cmd('colorscheme kanagawa-wave')
		end
	    },
	    {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = {'nvim-lua/plenary.nvim'}
	    },
	    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	    {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = {'nvim-lua/plenary.nvim'}
	    },
	    'mbbill/undotree',
	    'tpope/vim-fugitive',
	}

	local opt = {
	    {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
		    {'williamboman/mason.nvim'},
		    {'williamboman/mason-lspconfig.nvim'},
		    {'neovim/nvim-lspconfig'},
		    {'hrsh7th/nvim-cmp'},
		    {'hrsh7th/cmp-nvim-lsp'},
		    {'L3MON4D3/LuaSnip'}
		}
	    },
	}


	require("lazy").setup(plugins,opts)

	local config = require("nvim-treesitter.configs")
	config.setup {
	  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
	  sync_install = false,
	  highlight = {
	    enable = true,
	  },
	}
end
