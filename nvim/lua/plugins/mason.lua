return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'bash-language-server',
        'black',
        'codelldb',
        'go-debug-adapter',
        'goimports',
        'gopls',
        'jsonlint',
        'mypy',
        'pylint',
        'pyright',
        'ruff',
        'rust-analyzer',
        'sql-formatter',
        'sqlls',
        'terraform-ls',
        'yaml-language-server',
      })
    end,
  },
}
