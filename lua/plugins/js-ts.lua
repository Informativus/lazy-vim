return {
  -- nvim-treesitter: JS/TS синтаксис
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "javascript", "typescript", "tsx", "json", "html", "css" })
    end,
  },

  -- LSP для TS/JS
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
      },
    },
  },

  -- Mason: ensure JS/TS инструменты
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server", -- LSP
        "eslint_d", -- линтер
        "prettierd", -- автоформат
      },
    },
  },

  -- DAP для Node.js/TS
  {
    "mfussenegger/nvim-dap",
    lazy = true,
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-vscode-js").setup({
        node_path = "node", -- path to node executable
        debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      })
    end,
    ft = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
  },

  -- Neotest для JS/TS (например с Jest)
  {
    "nvim-neotest/neotest",
    dependencies = { "haydenmeade/neotest-jest", "nvim-neotest/nvim-nio" },
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },
      },
    },
  },
}
