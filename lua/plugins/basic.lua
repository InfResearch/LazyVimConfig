return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        emmylua_ls = {
          filetypes = { "lua" },
          root_markers = { ".emmyrc.json", ".luarc.json", ".git" },
        },
        lua_ls = false,
      },
    },
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "encoding")
      table.insert(opts.sections.lualine_x, "fileformat")
      table.insert(opts.sections.lualine_x, "filetype")
      return opts
    end,
  },

  { "mrjones2014/smart-splits.nvim" },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      on_highlights = function(highlights, colors)
        highlights.LineNr = { fg = colors.fg_dark }
        highlights.LineNrAbove = { fg = colors.fg_dark }
        highlights.LineNrBelow = { fg = colors.fg_dark }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    ---@class wk.Opts
    opts = {
      preset = "modern"
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "jackplus-xyz/scroll-it.nvim",
    opts = {
        -- Add your configuration here
    }
  },

  {
    "folke/snacks.nvim",
    opts = {
      scroll = {
        enabled = true,
        animate = {
          duration = {
            step = 15, -- 每一步动画时长(ms)，默认 20
            total = 50, -- 单次滚动最大动画时长(ms)，默认 80
          },
        },
      },
      picker = {
        sources = {
          files = {
            exclude = { "*.meta", "*.csproj", "*.sln", "Library", "Temp", "Logs", "UserSettings", "obj" },
          },
          grep = {
            exclude = { "*.meta", "*.csproj", "*.sln", "Library/**", "Temp/**", "Logs/**", "UserSettings/**", "obj/**" },
          },
          explorer = {
            exclude = { "*.meta", "*.csproj", "*.sln", "Library/*", "Temp/*", "Logs/*", "UserSettings/*", "obj/*" },
          },
        },
      },
    },
  },

  {
    "coder/claudecode.nvim",
    opts = {
      terminal = {
        split_width_percentage = 0.45, -- 默认 0.30，调大到 45%
      },
    },
  },

  {
    "MagicDuck/grug-far.nvim",
    opts = {
      engines = {
        ripgrep = {
          extraArgs = "--glob=!*.meta --glob=!*.csproj --glob=!*.sln --glob=!Library/** --glob=!Temp/** --glob=!Logs/** --glob=!UserSettings/** --glob=!obj/**",
        },
      },
    },
  },
}
