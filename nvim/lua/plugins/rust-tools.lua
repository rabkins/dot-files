return {
  'simrat39/rust-tools.nvim',
  opts = {
    -- dap = {
    --   adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
    -- },
    dap = {
      args = {
        '--arch',
        'x86_64',
      },
    },
    tools = {
      hover_actions = {
        auto_focus = true,
      },
    },
  },
}
