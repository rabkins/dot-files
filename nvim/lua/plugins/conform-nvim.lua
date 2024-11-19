return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        ['lua '] = { 'stylua' },
        ['python'] = { 'ruff_fix', 'ruff_format' },
        ['rust'] = { 'rustfmt' },
        ['groovy'] = { 'npm-groovy-lint' },
        ['xml'] = { 'xmlformatter' },
      },
    },
  },
}
