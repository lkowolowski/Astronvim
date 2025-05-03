return {
  {
    "joshuadanpeterson/typewriter",
    config = function()
      -- autocommand for entering typewriter mode
      require("typewriter").setup {
        enable_notifications = true,
        keep_cursor_position = true,
        enable_horizontal_scroll = false,
        enable_with_zen_mode = false,
      }
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Enable typewriter mode",
        pattern = "php,go,rst,javascript,python,html,css,bash,sh,sql,yaml,json,c,cpp,java,lua,markdown,make,perl",
        callback = function()
          vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "<buffer>",
            callback = function() require("typewriter.commands").enable_typewriter_mode() end,
          })
        end,
      })
    end,
  },
}
