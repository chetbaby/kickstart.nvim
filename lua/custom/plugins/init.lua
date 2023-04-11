-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  "folke/lsp-colors.nvim",
  "Yggdroot/indentLine",
  "p00f/nvim-ts-rainbow",
  "morhetz/gruvbox",
  "romainl/vim-qf",
  "alvan/vim-closetag",
  "alvan/vim-closetag",
  "AndrewRadev/tagalong.vim",
  "jiangmiao/auto-pairs",
  "Valloric/MatchTagAlways",
  "JoosepAlviste/nvim-ts-context-commentstring", --for jsx comments
  "tpope/vim-surround",
  {
		"akinsho/nvim-toggleterm.lua",
		tag = "v2.*",
		keys = { "<C-y>", "<leader>fl", "<leader>gt" },
		config = function()
			require("config/toggleterm")
		end,
	},
  {
    "numToStr/Comment.nvim",
    config = function()
      require("config/comment")
    end,
  },
  {
    "qpkorr/vim-bufkill",
    config = function()
      require("config/bufkill")
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async"},
    config = function()
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
          vim.o.foldcolumn = '5'
          vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
          vim.o.foldlevelstart = 99
          vim.o.foldenable = true
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("config/trouble")
    end,
  },
  {
    "rcarriga/nvim-notify", -- don't know how to use this
    config = function()
      require("config/notify")
    end,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config/harpoon")
    end,
  },
  {
    "akinsho/nvim-bufferline.lua",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
    event = "BufReadPre",
    config = function()
      require("config/bufferline")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function ()
      require("colorizer").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    'rmagatti/auto-session',
    config = function()
    require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
    }
    end
  },
}
