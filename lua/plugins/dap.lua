return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("mason").setup()
    require("mason-nvim-dap").setup({
      automatic_installation = true,
      -- add adapters here as needed, e.g. { "python", "codelldb" }
      ensure_installed = { "codelldb", "python" },
    })

    dapui.setup()

    -- C/C++ via codelldb
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
      },
    }
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp

    -- Auto open/close UI with debug session
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    local map = vim.keymap.set
    map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
    map("n", "<leader>dc", dap.continue,          { desc = "DAP continue" })
    map("n", "<leader>di", dap.step_into,         { desc = "DAP step into" })
    map("n", "<leader>do", dap.step_over,         { desc = "DAP step over" })
    map("n", "<leader>dO", dap.step_out,          { desc = "DAP step out" })
    map("n", "<leader>du", dapui.toggle,          { desc = "DAP toggle UI" })
    map("n", "<leader>dr", dap.repl.open,         { desc = "DAP open REPL" })
  end,
}
