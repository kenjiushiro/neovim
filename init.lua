require "core.global"
require "core.options"
require "core.mappings"
require "modules.plugins"
require("modules.plugins.dap").setup()
require('dap.ext.vscode').load_launchjs()
