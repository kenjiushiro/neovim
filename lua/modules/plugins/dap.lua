local dap = require('dap')

local function debugJest(testName, filename)
  print("starting " .. testName .. " in " .. filename)
  dap.run({
      type = 'node2',
      request = 'launch',
      cwd = vim.fn.getcwd(),
      runtimeArgs = {'--inspect-brk', '/usr/local/bin/jest', '--no-coverage', '-t', testName, '--', filename},
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      console = 'integratedTerminal',
      port = 9229,
      })
end

local function attach()
  print("attaching to 9229")
  dap.run({
      type = 'node2',
      request = 'attach',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      })
end
local function attach9300()
  print("attaching to 9300")
  dap.run({
      type = 'node2',
      request = 'attach',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      port = 9300,
      })
end
return {
    attach = attach,
    attach9300 = attach9300,
    debugJest = debugJest,
    setup = function()
        dap.adapters.node2 = {
            type = "executable",
            command = "node",
            args = {
                os.getenv("HOME") .. "/.config/debuggers/vscode-node-debug2/out/src/nodeDebug.js",
            },
        }

        dap.configurations.typescript = {
            {
              type = "node2",
              name = "Debug",
              request = "attach",
              protocol = "inspector",
              restart = true,
              sourceMaps = true,
              skipFiles = { "<node_internals>/**" },
              outFiles = { "${workspaceFolder}/**/*.js" }
            }
        }

        dap.configurations.typescriptreact = {
            name = "Debug with Firefox",
            type = "firefox",
            request = "launch",
            reAttach = true,
            sourceMaps = true,
            url = "http://localhost:6969",
            webRoot = "${workspaceFolder}",
            firefoxExecutable = "/usr/bin/firefox",
        }


        dap.configurations.typescriptreact = {
            {
                name = "Launch",
                type = "node2",
                request = "launch",
                program = "${file}",
                cwd = vim.fn.getcwd(),
                sourceMaps = true,
                protocol = "inspector",
                console = "integratedTerminal",
            },
            {
                -- For this to work you need to make sure the node process is started with the `--inspect` flag.
                name = "Attach to process",
                type = "node2",
                request = "attach",
                processId = require("dap.utils").pick_process,
            },
        }


        -- setup extensions
        require("nvim-dap-virtual-text").setup()
        -- require("plugin.dap.mappings").setup()
    end,
}
