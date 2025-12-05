return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          { "K", false },
          { "L", vim.lsp.buf.hover, desc = "Hover" },
          { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", has = "codeAction" },
        },
      },
    },
  },
}
