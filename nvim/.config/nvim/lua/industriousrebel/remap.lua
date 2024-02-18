vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv",vim.cmd.Ex)
vim.api.nvim_set_keymap('v', '<C-c>', ':!pbcopy<CR>gv', { noremap = true })

