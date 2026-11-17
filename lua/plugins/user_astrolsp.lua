---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    servers = {
      "harper_ls",
      "pyright",
      "ruff",
      "rumdl",
    },
    config = {
      rumdl = {
        cmd = { "rumdl", "server" },
        filetypes = { "markdown" },
        root_markers = { ".rumdl.toml", "rumdl.toml", ".git" },
      },
      harper_ls = {
        filetypes = { "markdown", "text", "gitcommit", "typst" },
        settings = {
          ["harper-ls"] = {
            workspaceDictPath = "",
            userDictPath = "~/.config/harper-ls/dictionary.txt",
            linters = {
              -- Set specific rules to false to disable them
              SpellCheck = true,
              SpelledNumbers = false,
              AnA = true,
              SentenceCapitalization = true,
              UnclosedQuotes = true,
              WrongApostrophe = false,
              LongSentences = true,
              RepeatedWords = true,
              Spaces = true,
              CorrectNumberSuffix = true,
            },
            codeActions = {
              ForceStable = false,
            },
            markdown = {
              IgnoreLinkTitle = false,
            },
            diagnosticSeverity = "hint",
            isolateEnglish = false,
            dialect = "American",
            maxFileLength = 120000,
            ignoredLintsPath = "",
            excludePatterns = {},
          },
        },
      },
    },
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
      },
      disabled = {
        "harper_ls",
      },
      timeout_ms = 1000,
    },
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.enable(true, { bufnr = args.buf }) end
          end,
        },
      },
    },
    mappings = {
      n = {
        K = {
          function()
            local has_hover = false
            for _, client in ipairs(vim.lsp.get_clients { bufnr = 0 }) do
              if client:supports_method "textDocument/hover" then
                has_hover = true
                break
              end
            end
            if has_hover then
              vim.lsp.buf.hover {
                border = "single",
                max_height = 25,
                max_width = 120,
              }
            else
              vim.diagnostic.open_float()
            end
          end,
          desc = "Hover documentation (or diagnostic)",
        },
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client:supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
      },
    },
  },
}
