return {
  {
    "saghen/blink.cmp",
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
    version = "v1.*",
    opts = {
      sources = {
        default = { "snippets", "lsp", "buffer", "path" },
        providers = {
          lsp = {
            async = true,
          },
          dbee = { name = "dbee", module = "blink.compat.source" },
        },
        per_filetype = {
          sql = { "dbee", "buffer" },
        },
      },
      keymap = {
        ["<Tab>"] = { "select_next", "fallback_to_mappings" },
        ["<S-Tab>"] = { "select_prev", "fallback_to_mappings" },
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
}
