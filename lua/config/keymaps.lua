-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local wk = require("which-key")
local map = vim.keymap.set

wk.add({
  { "<leader>w", "<cmd>w<CR>", desc = "Save" },
})

vim.keymap.set("i", "jj", "<ESC>", { desc = "Exit from input" })
vim.keymap.set("n", "<leader>ay", "ggV", { desc = "Exit from input" })

vim.keymap.set("n", "K", "5k", { desc = "Move 5 lines up" })
vim.keymap.set("n", "J", "5j", { desc = "Move 5 lines down" })

wk.add({
  { "<leader>p", group = "Check Huck" },
})

wk.add({
  { "<leader>r", group = "Refactoring" },
})

wk.add({
  { "<leader>d", group = "Dublicate" },
})

local utils = require("config.utils")

wk.add({
  { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  {
    "<leader>rp",
    function()
      utils.replace_words()
    end,
    desc = "Replace text",
  },
}, { mode = "n" })

map("v", "<leader>dl", "yPgv", { desc = "Duplicate selection below" })

-- Code
wk.add({
  { "<leader>c", group = "Code" },
  { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
  { "<leader>cq", "<cmd>wq<cr>", desc = "Quit with save" },
  { "<leader>cQ", "<cmd>qa<cr>", desc = "Quit all with check save" },
})

-- Tmux
wk.add({
  { "<c-l>", "<cmd>:TmuxNavigateRight<cr>", desc = "Tmux Right" },
  { "<c-h>", "<cmd>:TmuxNavigateLeft<cr>", desc = "Tmux Left" },
  { "<c-k>", "<cmd>:TmuxNavigateUp<cr>", desc = "Tmux Up" },
  { "<c-j>", "<cmd>:TmuxNavigateDown<cr>", desc = "Tmux Down" },
}, { mode = { "n", "t", "v" } })

-- Move selected text up
map("v", "<S-k>", ":m .-2<CR>gv-gv", { desc = "Move Selected Text Up" })

-- Move selected text down
map("v", "<S-j>", ":move '>+1<CR>gv-gv", { desc = "Move Selected Text Down" })

-- telescope
wk.add({
  { "<leader>f", group = "telescope" },
  { "<leader>ft", "<cmd>TodoTrouble<CR>", desc = "Find Todo" },
}, { mode = { "n", "v", "i" } })

-- Duplicate Line
wk.add({
  { "<leader>d", "<cmd>t.<cr>", desc = "Duplicate Line" },
}, { mode = "n" })

-- Trouble
wk.add({
  { "<leader>q", group = "Trouble" },
  { "<leader>qx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble Diagnostics" },
  { "<leader>qX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble Buffer Diagnostics" },
  { "<leader>qc", "<cmd>Trouble code_actions<cr>", desc = "Trouble Code Actions" },
  { "<leader>ql", "<cmd>Trouble lsp_definitions<cr>", desc = "Trouble LSP Definitions" },
  { "<leader>qL", "<cmd>Trouble loclist<cr>", desc = "Trouble Location List" },
  { "<leader>qQ", "<cmd>Trouble quickfix<cr>", desc = "Trouble Quickfix List" },
})

-- Test
wk.add({
  { "<leader>t", group = "Test" },
  {
    "<leader>tt",
    function()
      require("neotest").run.run()
    end,
    desc = "Test Nearest",
  },
  {
    "<leader>tf",
    function()
      require("neotest").run.run(vim.fn.expand("%"))
    end,
    desc = "Test File",
  },
  { "<leader>to", "<cmd>Neotest output<CR>", desc = "Show test output" },
  { "<leader>ts", "<cmd>Neotest summary<CR>", desc = "Show test summary" },
})

-- Git
wk.add({
  { "<leader>g", group = "Git" },
  {
    "<leader>gl",
    function()
      local ok, snacks = pcall(require, "snacks")
      if not ok then
        vim.notify("snacks.nvim is not installed", vim.log.levels.WARN)
        return
      end
      -- Открываем lazygit
      snacks.lazygit.open()
    end,
    desc = "Open lazygit",
  },
})

wk.add({
  {
    "<C-]>",
    function()
      require("nvchad.term").toggle({ pos = "vsp", size = 0.4 })
    end,
    desc = "Toggle Terminal Vertical",
  },
  {
    "<C-\\>",
    function()
      require("nvchad.term").toggle({ pos = "sp", size = 0.4 })
    end,
    desc = "Toggle Terminal Horizontal",
  },
  {
    "<C-f>",
    function()
      require("nvchad.term").toggle({ pos = "float" })
    end,
    desc = "Toggle Terminal Float",
  },
}, { mode = "n" })

wk.add({
  {
    "<C-]>",
    function()
      require("nvchad.term").toggle({ pos = "vsp" })
    end,
    desc = "Toggle Terminal Vertical",
  },
  {
    "<C-\\>",
    function()
      require("nvchad.term").toggle({ pos = "sp" })
    end,
    desc = "Toggle Terminal Horizontal",
  },
  {
    "<C-f>",
    function()
      require("nvchad.term").toggle({ pos = "float" })
    end,
    desc = "Toggle Terminal Float",
  },
}, { mode = "t" })

-- Visual Multi
local function visual_cursors_with_delay()
  print("Visual multi")
  vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
  vim.cmd("sleep 200m")
  vim.cmd('silent! execute "normal! A"')
end

wk.add({
  { "<leader>m", group = "Visual Multi" },
  { "<leader>ms", "<Plug>(VM-Select-All)", desc = "Select All" },
  { "<leader>mo", "<Plug>(VM-Toggle-Mappings)", desc = "Toggle Mappings" },
  { "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", desc = "VM Add Cursor At Pos" },
  { "<leader>mr", "<Plug>(VM-Start-Regex-Search)", desc = "Start Regex Search" },
}, { mode = "n" })

map("v", "<leader>mv", visual_cursors_with_delay, { desc = "Visual Cursors" })

-- Ufo
wk.add({
  { "zR", require("ufo").openAllFolds, desc = "Open all folds" },
  { "zM", require("ufo").closeAllFolds, desc = "Close all folds" },
})

-- lsp-lens
wk.add({
  { "<leader>l", group = "LSP-Lens" },
  { "<leader>lu", "<cmd>Telescope lsp_references<cr>", desc = "LSP Usages (References)" },
  { "<leader>lo", "<cmd>LspLensToggle<cr>", desc = "On/off LSP Lens" },
}, { mode = "n" })

-- Accept suggestion
map("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

-- Clear suggestion
map("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })

-- Cycle completions (backward)
map("i", "<C-f>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })

-- Cycle completions (forward)
map("i", "<C-s>", function()
  return vim.fn
end, { expr = true, silent = true })

-- AcceptGit Log next word
map("i", "<C-w>", function()
  return vim.fn["codeium#AcceptNextWord"]()
end, { expr = true, silent = true })

-- LSP
wk.add({
  { "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to Declaration" },
  { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
})

-- Barbar
wk.add({
  { "<leader>z", group = "Buffers" },
  {
    "<leader>zx",
    function()
      Snacks.bufdelete.other()
    end,
    desc = "Close All Buffers",
  },
})

-- Tabs
-- Переключение на следующий буфер
vim.keymap.set("n", "<Tab>", function()
  vim.cmd("bnext")
end, { desc = "Next Buffer", noremap = true, silent = true })

-- Переключение на предыдущий буфер
vim.keymap.set("n", "<S-Tab>", function()
  vim.cmd("bprevious")
end, { desc = "Previous Buffer", noremap = true, silent = true })

vim.keymap.set("n", "<leader>x", function()
  vim.cmd("bdelete") -- или "bd" для краткости
end, { desc = "Close current buffer", noremap = true, silent = true })
-- Dbee
wk.add({
  { "<leader>db", "<cmd>Dbee open<cr>", desc = "Open Dbee" },
  { "<leader>dc", "<cmd>Dbee close<cr>", desc = "Close Dbee" },
})

vim.keymap.set("n", "<leader>ri", function()
  vim.lsp.buf.code_action({
    context = { only = { "source.addMissingImports", "source.organizeImports" } },
    apply = true,
  })
end, { desc = "Add/Organize imports" })
