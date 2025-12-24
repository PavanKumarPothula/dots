return {
  -- 1. Disable the default mini.surround
  {
    "echasnovski/mini.surround",
    enabled = false,
  },

  -- 2. Install nvim-surround (Required by surround-ui)
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  -- 3. Install surround-ui
  {
    "roobert/surround-ui.nvim",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    config = function()
      require("surround-ui").setup({
        root_key = "<leader>S", -- This defines the key that opens the menu
      })
    end,
  },
}
