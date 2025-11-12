return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  ---@class snacks.dashboard.Config
  ---@field enabled? boolean
  ---@field sections snacks.dashboard.Section
  ---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>

  opts = {
    picker = {
      sources = {
        explorer = {
          layout = {
            auto_hide = { "input" },
            layout = {
              position = "left",
              width = 0.2,
            },
          },
          backdrop = false,
          border = "none",
          filters = {
            dotfiles = true,
            hidden = true,
          },
        },
        files = {
          hidden = true,
          ignored = true,
        },
      },
      hidden = true,
      ignored = true,
    },
    dashboard = {
      preset = {
        header = [[
    ██╗██╗   ██╗ █████╗ ███╗   ██╗    ██████╗  ██████╗ ██████╗  ██████╗ ██╗   ██╗
    ██║██║   ██║██╔══██╗████╗  ██║    ██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗██║   ██║
    ██║║██╗ ██╔╝███████║██╔██╗ ██║    ██████╔╝██║   ██║██████╔╝██║   ██║║██╗ ██╔╝
    ██║╚██║ ██║ ██╔══██║██║╚██╗██║    ██╔═══╝ ██║   ██║██╔═══╝ ██║   ██║╚██║ ██║ 
    ██║ ╚████╔╝ ██║  ██║██║ ╚████║    ██║     ╚██████╔╝██║     ╚██████╔╝ ╚████╔╝ 
    ╚═╝  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝    ╚═╝      ╚═════╝ ╚═╝      ╚═════╝   ╚═══╝  
                                                                                 
                             󱐋 Powered By  neovim                               ]],
      },
      sections = {
        { section = "header" },
        {
          section = "keys",
          gap = 1,
          padding = 1,
          items = {
            { icon = " ", title = "Find File", action = "Telescope find_files" },
            { icon = " ", title = "New File", action = "enew" },
            { icon = " ", title = "Projects", action = "Telescope projects" },
            { icon = " ", title = "Find Text", action = "Telescope live_grep" },
            { icon = " ", title = "Recent Files", action = "Telescope oldfiles" },
          },
          overwrite = true,
        },
      },
    },
  },
}
