return {
  {
    "mason-org/mason.nvim",
    -- version = "1.11.0",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash-language-server",
        "debugpy",
        "jsonlint",
        "mypy",
        "pylint",
        "pyright",
        "ruff",
        "shellcheck",
        "sql-formatter",
        "terraform-ls",
        "xmlformatter",
        "yaml-language-server",
        "yamlfmt",
      })
    end,
  },
  -- {
  --   "mason-org/mason-lspconfig.nvim",
  --   version = "1.32.0",
  -- },
}
