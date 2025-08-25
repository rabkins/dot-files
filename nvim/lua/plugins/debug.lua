return {
  "mrcjkb/rustaceanvim",
  config = function()
    local dap = require("dap")
    dap.set_log_level("TRACE")

    dap.adapters["probe-rs"] = {
      type = "server",
      port = "${port}",
      executable = {
        command = "probe-rs",
        args = { "dap-server", "--log-file", vim.fn.getcwd() .. "/_dap.log", "--port", "${port}" },
        -- args = { "dap-server", "--log-to-folder", "--port", "${port}" },
      },
    }
    dap.configurations.rust = {
      {
        name = "Debug ESP32 (probe-rs)",
        type = "probe-rs",
        request = "launch",
        cwd = "${workspaceFolder}",
        stopOnEntry = false,

        coreConfigs = {
          {
            core = 0,
            halt = true,
            reset = true,
            programBinary = function()
              return vim.fn.input(
                "Path to firmware ELF: ",
                vim.fn.getcwd() .. "/target/riscv32imc-unknown-none-elf/debug/",
                "file"
              )
            end,
          },
        },
      },
    }

    vim.g.rustaceanvim = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<F5>", dap.continue, { buffer = bufnr })
          vim.keymap.set("n", "<F10>", dap.step_over, { buffer = bufnr })
          vim.keymap.set("n", "<F11>", dap.step_into, { buffer = bufnr })
          vim.keymap.set("n", "<F12>", dap.step_out, { buffer = bufnr })
          vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { buffer = bufnr })
        end,
      },
    }
  end,

  --   {
  --     "mfussenegger/nvim-dap",
  --     dependencies = {
  --       "rcarriga/nvim-dap-ui",
  --       "theHamsta/nvim-dap-virtual-text",
  --     },
  --     config = function()
  --       local dap = require("dap")
  --
  --       -- dap-ui setup
  --       local dapui = require("dapui")
  --       dapui.setup()
  --
  --       dap.listeners.after.event_initialized["dapui_config"] = function()
  --         dapui.open()
  --       end
  --       dap.listeners.before.event_terminated["dapui_config"] = function()
  --         dapui.close()
  --       end
  --       dap.listeners.before.event_exited["dapui_config"] = function()
  --         dapui.close()
  --       end
  --
  --       -- dap-virtual-text setup
  --       require("nvim-dap-virtual-text").setup()
  --
  --       -- PROBE-RS adapter (starts probe-rs dap-server automatically)
  --       dap.adapters.probe_rs = {
  --         type = "server",
  --         port = "${port}", -- let nvim-dap pick a free port
  --         executable = {
  --           command = "probe-rs",
  --           args = { "dap-server", "--chip", "esp32c3", "--port", "${port}" },
  --         },
  --       }
  --
  --       -- Rust debugging config
  --       dap.configurations.rust = {
  --         {
  --           name = "Debug ESP32 (probe-rs)",
  --           type = "probe_rs",
  --           request = "launch",
  --           cwd = "${workspaceFolder}",
  --           program = "${workspaceFolder}/target/riscv32imc-unknown-none-elf/debug/_prs",
  --           stopOnEntry = true,
  --         },
  --       }
  --     end,
  --   },
  --
  --   "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require("dap")
  --     -- local dapui = require("dapui")
  --
  --     dap.adapters.probe_rs = {
  --       type = "server",
  --       port = 5000,
  --       exectuable = {
  --         command = "prove-rs",
  --         args = { "dap-server", "--chip", "esp32c3" },
  --       },
  --     }
  --
  --     dap.configuration.rust = {
  --       {
  --         name = "Debug esp32 (probe-rs)",
  --         type = "probe_rs",
  --         request = "launch",
  --         cwd = "$(workspaceFolder)",
  --         program = "$(workspaceFolder)/target/riscv32imc-unknown-none-elf/debug/_prs",
  --         stopOnEntry = true,
  --       },
  --     }
  --   end,
}
