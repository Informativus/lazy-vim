return {
  -- nvim-treesitter: Go синтаксис
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "go", "gomod", "gowork", "gosum" })
    end,
  },

  -- LSP для Go
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
      },
    },
  },

  -- Mason: ensure Go инструменты
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls", -- LSP
        "golangci-lint", -- линтер
        "goimports", -- автоформат
        "gofumpt", -- форматтер
        "gomodifytags", -- генерация тегов
        "impl", -- генерация интерфейсов
        "delve", -- debugger
      },
    },
  },

  -- Go тесты и DAP
  {
    "mfussenegger/nvim-dap",
    lazy = true,
  },
  {
    "leoluz/nvim-dap-go",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-go").setup()
    end,
    ft = { "go", "gomod" },
  },

  {
    "nvim-neotest/neotest",
    dependencies = { "fredrikaverpil/neotest-golang", "nvim-neotest/nvim-nio" },
    opts = {
      adapters = {
        ["neotest-golang"] = {
          dap_go_enabled = true,
        },
      },
    },
  },
}
