return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "mrcjkb/rustaceanvim",
  },
  opts = {
    adapters = {
      ["neotest-python"] = {
        runner = "pytest",
        dap = {
          justMyCode = false,
        },
        -- args = {
        --   '-m integration -p no:warnings',
        -- },
      },
      ["rustaceanvim.neotest"] = {},
    },
  },
}
