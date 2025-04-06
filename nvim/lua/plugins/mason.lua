return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash-language-server",
        "debugpy",
        "jsonlint",
        "mypy",
        "pylint",
        "pyright",
        "ruff",
        "ruff-lsp",
        "sql-formatter",
        "terraform-ls",
        "xmlformatter",
        "yaml-language-server",
        "yamlfmt",
      })
    end,
  },
}
