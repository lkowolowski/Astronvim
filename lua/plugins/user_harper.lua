return {
  {
    "AstroNvim/astrolsp",
    opts = {
      servers = {
        "harper_ls",
      },

      config = {
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              userDictPath = vim.fn.expand "~/.config/harper-ls/dictionary.txt",
              workspaceDictPath = "",
              fileDictPath = "",
              linters = {
                SpellCheck = true,
                SpelledNumbers = false,
                AnA = true,
                SentenceCapitalization = false,
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
    },
  },
}
