
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
{
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },

  -- 2. Install and configure oil.nvim
  {
    "stevearc/oil.nvim",
    lazy = false, -- Load immediately to handle opening directories
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Visual file icons
    config = function()
      require("oil").setup({
        default_file_explorer = true, -- Replaces netrw seamlessly
        view_options = {
          show_hidden = true,       -- Set to false if you want hidden files hidden by default
        },
      })
    end,
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  
}
