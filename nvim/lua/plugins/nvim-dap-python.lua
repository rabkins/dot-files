return {
  {
    'mfussenegger/nvim-dap-python',
    config = function()
      local dap = require('dap')
      for _, config in ipairs(dap.configurations.python) do
        config.justMyCode = false
      end
    end,
  },
}
---@class Configuration
---@field justMyCode boolean
