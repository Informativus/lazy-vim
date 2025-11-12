return {
  "Exafunction/codeium.vim",
  lazy = false, -- загружаем сразу
  config = function()
    vim.g.codeium_disable_bindings = 1 -- отключаем стандартные клавиши, чтобы использовать свои
  end,
}
