-- LANGUAGE PROVIDERS
vim.g.loaded_perl_provider = 0

local options = {
	autochdir = false,
	modifiable = true,
	errorbells = false,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	smarttab = true,
	autoindent = true,
	smartindent = true,
	number = true,
	relativenumber = true,
	swapfile = false,
	backup = false,
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	hlsearch = true,
	ruler = true,
	laststatus = 2,
	showcmd = true,
	showmode = true,
	list = true,
	listchars = { tab = ">·", trail = "·" },
	wrap = true,
	breakindent = true,
	encoding = "utf-8",
	background = "dark",
	title = true,
	--[[ foldmethod = "expr", ]]
	--[[ foldexpr = "nvim_treesitter#foldexpr()", ]]
	--[[ foldnestmax = 30, ]]
  foldcolumn = '1',
	foldenable = true,
	foldlevel = 99,
	foldlevelstart = 99,
	splitbelow = true,
	splitright = true,
	viewoptions = "cursor,folds,slash",
	hidden = true,
	cmdheight = 2,
	updatetime = 100,
	signcolumn = "yes",
	autoread = true,
	scrolloff = 22,
	clipboard = "unnamedplus",
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	mouse = "a",
	pumheight = 10,
	showtabline = 2,
	termguicolors = true,
	undofile = true,
	-- undolevels = 5000, -- how to check?
	-- undodir = "$HOME/.config/nvim/.NVIM_UNDO_FILES",
	guifont = "monospace:h17",
	cursorline = true,
}

vim.opt.shortmess:append("c")
vim.opt.fillchars:append("vert:\\")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

-- ***********  FOR LSP  *********** not doing anything
local M = {}

local servers = {
	sumneko_lua = {},
	tsserver = {},
}

local function on_attach(client, bufnr)
	-- Enable completion triggered by <C-X><C-O>
	-- See `:help omnifunc` and `:help ins-completion` for more information.
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Use LSP as the handler for formatexpr.
	-- See `:help formatexpr` for more information.
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	-- Configure key mappings
	require("config/keymaps").setup(client, bufnr)
end

local opts = {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
}

function M.setup()
	require("config.lsp.installer").setup(servers, opts)
end

return M
