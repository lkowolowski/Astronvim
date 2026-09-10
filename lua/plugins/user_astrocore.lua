return {
  "AstroNvim/astrocore",
  opts = {
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        tmpl = "bash",
      },
    },
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = true, -- sets vim.opt.spell
        spelllang = {
          "en_us",
        },
        spelloptions = "camel",
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
        -- columns = 80,
        textwidth = 85,
        linebreak = true,
        winborder = "rounded",
        conceallevel = 2,
        formatoptions = "jcroqnl",
      },
    },
  },
  -- Do this so themes don't overwrite our spellchecking
  init = function()
    local function set_spell_highlight()
      vim.api.nvim_set_hl(0, "SpellBad", {
        fg = "red",
        underline = true,
      })
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_spell_highlight,
    })

    set_spell_highlight()
  end,
}
