return {
  "mfussenegger/nvim-dap",
  config = function(_, opts)
    local dap = require("dap")
    dap.adapters.rust = {
      type = "executable",
      command = { os.getenv("HOME") .. "/home/boyin/.local/share/nvim/mason/bin/codelldb" },
      name = "codelldb",
    }
    dap.configurations.rust = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
  end,
}
