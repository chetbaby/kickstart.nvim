local keymap = vim.api.nvim_set_keymap
local noshow = { noremap = true, silent = true }
keymap("", "<leader>q", ":BD<CR>", noshow)
