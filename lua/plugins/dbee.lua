-- lua/plugins/dbee.lua
return {
  -- Основной автокомплит
  {
    "saghen/blink.cmp",
    version = "v1.*",
    enabled = true,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
      {
        "saghen/blink.compat",
        version = "2.*",
        lazy = true,
        opts = {},
      },
      {
        "MattiasMTS/cmp-dbee",
        branch = "ms/v2",
      },
    },
    opts = {
      sources = {
        default = { "snippets", "lsp", "buffer", "path" },
        providers = {
          lsp = { async = true },
          dbee = { name = "dbee", module = "blink.compat.source" },
        },
        per_filetype = {
          sql = { "dbee", "buffer" },
        },
      },
      enabled = function()
        local ft = vim.bo.filetype
        local buftype = vim.bo.buftype
        local disabled = { "NvimTree", "neo-tree", "TelescopePrompt", "DressingInput" }
        if vim.tbl_contains(disabled, ft) then
          return false
        end
        if buftype == "prompt" or buftype == "nofile" then
          return false
        end
        return true
      end,
    },
  },

  -- Плагин Dbee
  {
    "kndndrj/nvim-dbee",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("dbee").setup()
    end,
  },

  -- Mini Surround для удобного редактирования
  {
    "nvim-mini/mini.surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup()
    end,
  },
}
