local noshow = { noremap = true, silent = true }
local show = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

-- GIT SHIT
-- keymap("", "<leader>cm", ":BCommits<CR>", noshow) -- telescope
-- keymap("", "<leader><leader>g", ":Git<CR>", show)
keymap("", "<leader>gb", ":G blame<CR>", show)
-- keymap("", "<leader>log", ":G log<CR>", show)
-- keymap("", "<leader>ga", ":G add .<CR>", show)
keymap("", "<leader>gc", ":G commit<CR>", show)
keymap("", "<leader>amen", ":G commit --amend --no-edit<CR>", show)
keymap("", "<leader>up", ":G push -u origin<CR>", show)
keymap("", "<leader>chk", ":G checkout<CR>", show)
keymap("", "<leader>nb", ":G checkout -b", show)
-- keymap("", "<leader>br", ":G branch<CR>", show) -- telescope?
keymap("", "<leader>res", ":G reset --hard", show)
-- keymap("", "<leader>rr", ":G checkout --<CR>", show)
keymap("", "<leader>sta", ":G stash --index<CR>", show)
-- keymap("", "<leader>dif", ":SignifyDiff<CR>", noshow) -- another lua dif plugin?
-- keymap("", "<leader>mf", ":diffget //2<CR>", show) -- diff stuff i don't use
-- keymap("", "<leader>mj", ":diffget //3<CR>", show) -- diff stuff i don't use
keymap("", "<leader>G", ":15split | Gedit :<CR>", show)
keymap("", "<leader>hub", ":GBrowse<CR>", noshow)
keymap("", "<leader><leader>res", ":Gread<CR>", noshow)
