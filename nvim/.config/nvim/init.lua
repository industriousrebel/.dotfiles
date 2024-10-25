if vim.g.vscode then
    -- VSCode config
    vim.cmd[[source $HOME/.config/nvim/lua/vscode_config/init.vim]]
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
	}


	require("lazy").setup(plugins,opts)

end
