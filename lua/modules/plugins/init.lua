local pack_use = function()
    local use = require("packer").use
    use { "wbthomason/packer.nvim" }
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
        "kabouzeid/nvim-lspinstall",
        after = "nvim-lspconfig",
        config = function()
            require "modules.lsp.servers"
        end,
    }
    -----------------------------------------------------------------------------//
    -- Completion and snippets {{{1
    -----------------------------------------------------------------------------//
    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("modules.plugins.completion").compe()
        end,
    }
    use { "hrsh7th/vim-vsnip", after = "nvim-compe" }
    use { "rafamadriz/friendly-snippets" }
    -----------------------------------------------------------------------------//
    -- Telescope {{{1
    -----------------------------------------------------------------------------//
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        opt = true,
        run = "make",
    }
    use {
        "nvim-telescope/telescope.nvim",
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
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "nvim-web-devicons",
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
        config = function()
            require("modules.plugins.filetree").config()
        end,
    }
    use {
        "akinsho/nvim-toggleterm.lua",
        keys = "<A-t>",
        cmd = "ToggleTerm",
        config = function()
            require("toggleterm").setup {
                size = 20,
                direction = "horizontal",
                open_mapping = [[<a-t>]],
            }
        end,
    }
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
        ft = { "html", "css", "javascript" },
        cmd = { "ColorizerToggle", "ColorizerAttachToBuffer" },
        config = function()
            require("colorizer").setup({ "html", "javascript", "css" }, {
                RRGGBBAA = true,
                rgb_fn = true,
                hsl_fn = true,
                css = true,
                css_fn = true,
            })
        end,
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
