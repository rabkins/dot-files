return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    lazygit = {},
    dashboard = {
      enabled = true,
      preset = {
        -- header = "Don't panic !",
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = ' ',
            key = 'c',
            desc = 'Config',
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = '🤖', key = 'M', desc = 'Mason', action = ':Mason' },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
      sections = {
        { pane = 1, section = 'keys', gap = 1, padding = 1 },
        { pane = 1, section = 'startup' },
        { pane = 2, section = 'terminal', cmd = "figlet Don\\'t Panic", indent = 5 },
        { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        {
          pane = 2,
          icon = ' ',
          title = 'Git Status',
          section = 'terminal',
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = 'git status --short --branch --renames',
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
      },
    },
  },
}
