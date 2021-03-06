pcall(require,"impatient")
local pack_use = function()
    local use = require("packer").use
    use { "wbthomason/packer.nvim" }
    use { "lewis6991/impatient.nvim" }
    -----------------------------------------------------------------------------//
    -- Required by others {{{1
    -----------------------------------------------------------------------------//
    use { "nvim-lua/plenary.nvim", module = "plenary" }
    use { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" }
    -----------------------------------------------------------------------------//
    -- LSP {{{1
    -----------------------------------------------------------------------------//
    use { "ray-x/lsp_signature.nvim" }
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require "modules.lsp"
        end,
    }
    use {
        "williamboman/nvim-lsp-installer",
        after = "nvim-lspconfig",
        config = function()
            require "modules.lsp.servers"
        end,
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
    }
    -----------------------------------------------------------------------------//
    -- Completion and snippets {{{1
    -----------------------------------------------------------------------------//
    use { "ms-jpq/coq_nvim" }
    use { "ms-jpq/coq.artifacts" }
    use { "ms-jpq/coq.thirdparty" }
    require'modules.plugins.coq'
    -- use {
    --     "hrsh7th/nvim-compe",
    --     event = "InsertEnter",
    --     config = function()
    --         require("modules.plugins.completion").compe()
    --     end,
    -- }
    use { "hrsh7th/vim-vsnip", after = "nvim-compe" }
    use { "rafamadriz/friendly-snippets" }
    -- use { "https://github.com/github/copilot.vim" }
    -----------------------------------------------------------------------------//
    -- Telescope {{{1
    -----------------------------------------------------------------------------//
    use "natecraddock/telescope-zf-native.nvim"
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        cmd = "Telescope",
        run = "make",
    }
    use {
        "nvim-telescope/telescope.nvim",
        -- requires = { {'nvim-lua/plenary.nvim'} },
        cmd = "Telescope",
        config = function()
            require("modules.plugins.telescope").config()
        end,
    }
    -----------------------------------------------------------------------------//
    -- Treesitter {{{1
    -----------------------------------------------------------------------------//
    use { "nvim-treesitter/playground", cmd = "TSHighlightCapturesUnderCursor" }
    use {
        "nvim-treesitter/nvim-treesitter",
        branch = "0.5-compat",
        run = ":TSUpdate",
        event = "BufRead",
        config = function()
            require("modules.plugins.treesitter").config()
        end,
    }
    -----------------------------------------------------------------------------//
    -- Debugging
    -----------------------------------------------------------------------------//
    use({ "mfussenegger/nvim-dap" })

    use({
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
    })
    use({
        "Pocco81/DAPInstall.nvim",
        requires = { "mfussenegger/nvim-dap" },
    })
    use({
        "theHamsta/nvim-dap-virtual-text",
        requires = { "mfussenegger/nvim-dap" },
    })
    -----------------------------------------------------------------------------//
    -- Utils {{{1
    -----------------------------------------------------------------------------//
    use { "haya14busa/is.vim", keys = { "/", "*", "#" } }
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
   }
    use { "christoomey/vim-tmux-navigator" }
    use {
        "rhysd/clever-f.vim",
        keys = { "f", "F", "t", "T" },
        config = function()
            vim.g.clever_f_across_no_line = 1
            vim.cmd "map ; <Plug>(clever-f-repeat-forward)"
            vim.cmd "map , <Plug>(clever-f-repeat-back)"
        end,
    }
    use {
        "folke/which-key.nvim",
        event = "BufWinEnter",
        config = function()
            require("modules.plugins.which-key").config()
        end,
    }
    use {
        "mhartington/formatter.nvim",
        cmd = { "Format", "FormatWrite" },
        config = function()
            require("modules.plugins.formatter").config()
        end,
    }
    use {"https://github.com/prettier/vim-prettier"}
    use {'https://github.com/ms-jpq/chadtree'}
    require("modules.plugins.chadtree")
    -----------------------------------------------------------------------------//
    -- Improve Editing {{{1
    -----------------------------------------------------------------------------//
    use { "psliwka/vim-smoothie" }
    use { "terryma/vim-multiple-cursors" }
    use { "machakann/vim-sandwich", event = "BufRead" }
    use { "tpope/vim-speeddating" }
    use { "Konfekt/vim-CtrlXA" }
    use {
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = function()
            require("modules.plugins.completion").autopairs()
        end,
    }
    use {
        "b3nj5m1n/kommentary",
        keys = { "gcc", "gc" },
        config = function()
            require("kommentary.config").configure_language("default", {
                prefer_single_line_comments = true,
            })
        end,
    }
    -----------------------------------------------------------------------------//
    -- Git {{{1
    -----------------------------------------------------------------------------//
    use {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        requires = "plenary.nvim",
        config = function()
            require("modules.plugins.git").gitsigns()
        end,
    }
    use {
        "TimUntersberger/neogit",
        cmd = "Neogit",
        config = function()
            require("modules.plugins.git").neogit()
        end,
    }
    use {
        "sindrets/diffview.nvim",
        opt = true,
        after = "neogit",
        cmd = "DiffviewOpen",
        config = function()
            require("modules.plugins.git").diffview()
        end,
    }
    use {
        "ruifm/gitlinker.nvim",
        opt = true,
        requires = "plenary.nvim",
        keys = { "<leader>gy" },
        config = function()
            require("modules.plugins.git").gitlinker()
        end,
    }
    use {'tpope/vim-fugitive'}
    -----------------------------------------------------------------------------//
    -- UI
    -----------------------------------------------------------------------------//
    use "rafamadriz/themes.nvim"
    use "morhetz/gruvbox"
    use "joshdick/onedark.vim"
    use {
        "rafamadriz/statusline",
        config = function()
            require("modules.plugins.statusline").config()
        end,
    }
    use {
        "mhinz/vim-startify",
        event = "VimEnter",
        config = function()
            require("modules.plugins.startify").config()
        end,
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
        cond = function()
            return as._default(vim.g.code_indent_guides, false)
        end,
        config = function()
            require("modules.plugins.indent-guides").config()
        end,
    }
    use {'pangloss/vim-javascript'}
    use {'mxw/vim-jsx'}
    -----------------------------------------------------------------------------//
    -- Database
    -----------------------------------------------------------------------------//
    use { "https://github.com/tpope/vim-dadbod" }
    use { "https://github.com/kristijanhusak/vim-dadbod-ui" }
    -----------------------------------------------------------------------------//
    -- General plugins {{{1
    -----------------------------------------------------------------------------//
    use { "kevinhwang91/nvim-bqf", ft = "qf" }
    use { 'michaelb/sniprun', run = 'bash ./install.sh'}
    use { "tpope/vim-repeat" }
    use {
        "ahmedkhalf/project.nvim",
        event = "BufRead",
        ft = "startify",
        config = function()
            require("project_nvim").setup {}
        end,
    }
    use {
        "turbio/bracey.vim",
        opt = true,
        ft = "html",
        run = "npm install --prefix server",
    }
    use {
        "iamcco/markdown-preview.nvim",
        opt = true,
        ft = "markdown",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    }
    use {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        config = "vim.g.undotree_WindowLayout = 2",
    }
    use {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            require("zen-mode").setup { plugins = { gitsigns = { enabled = true } } }
        end,
    }
    use {
        "norcalli/nvim-colorizer.lua",
        ft = { "html", "css", "javascript", "vue" },
        cmd = { "ColorizerToggle", "ColorizerAttachToBuffer" },
        config = function()
            require("colorizer").setup({ "html", "javascript", "css", "vue" }, {
                RRGGBBAA = true,
                rgb_fn = true,
                hsl_fn = true,
                css = true,
                css_fn = true,
            })
        end,
    }
    use {'neoclide/coc.nvim', branch = 'release'}
    use ( 'vim-test/vim-test' )
    use { "pr4th4m/coc-restclient" }
    use {
      "NTBBloodbath/rest.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("rest-nvim").setup({
          -- Open request results in a horizontal split
          result_split_horizontal = false,
          -- Keep the http file buffer above|left when split horizontal|vertical
          result_split_in_place = false,
          -- Skip SSL verification, useful for unknown certificates
          skip_ssl_verification = false,
          -- Highlight request on run
          highlight = {
            enabled = true,
            timeout = 150,
          },
          result = {
            -- toggle showing URL, HTTP info, headers at top the of result window
            show_url = true,
            show_http_info = true,
            show_headers = true,
          },
          -- Jump to request line on run
          jump_to_request = false,
          env_file = '.env',
          custom_dynamic_variables = {},
          yank_dry_run = true,
        })
      end
    }
end
-- }}}

local fn, execute = vim.fn, vim.api.nvim_command
local install_path = DATA_PATH .. "/site/pack/packer/start/packer.nvim"

local function load_plugins()
    local pack = require "packer"
    pack.init {
        compile_path = install_path .. "/plugin/packer_compiled.lua",
        git = { clone_timeout = 600 },
    }
    pack.startup {
        function()
            pack_use()
        end,
    }
end

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    load_plugins()
    require("packer").sync()
else
    load_plugins()
end
-- vim:foldmethod=marker
