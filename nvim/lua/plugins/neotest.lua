return {
  'nvim-neotest/neotest',
  optional = true,
  dependencies = {
    'nvim-neotest/neotest-python',
    'nvim-neotest/neotest-plenary',
    'rouge8/neotest-rust',
  },
  opts = {
    adapters = {
      ['neotest-python'] = {
        runner = 'pytest',
      },
      ['neotest-rust'] = {
        args = { '--no-capture' },
        dap_adapter = 'codelldb',
      },
    },
  },
}
