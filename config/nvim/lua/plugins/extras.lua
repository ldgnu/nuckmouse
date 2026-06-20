return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function() require("which-key").setup({ plugins = { spelling = true, presets = { operators = true } } }) end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({ default_file_explorer = false, view_options = { show_hidden = true } })
      vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        "  ╔══════════════════════════════════════════╗",
        "  ║       Keyboard-Driven Development        ║",
        "  ║         No mouse required                 ║",
        "  ╚══════════════════════════════════════════╝",
      }
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", "<cmd>ene<CR>"),
        dashboard.button("f", "  Find files", "<cmd>Telescope find_files<CR>"),
        dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
      }
      dashboard.section.footer.val = {}
      alpha.setup(dashboard.config)
    end,
  },
}
