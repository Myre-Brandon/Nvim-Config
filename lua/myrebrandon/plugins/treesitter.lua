return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local parsers = { 'c', 'java', 'typescript', 'go', 'rust', 'javascript', 'zig', 'lua', 'luadoc', 'python', 'markdown', 'bash', 'vim', 'vimdoc' }
    require('nvim-treesitter').install(parsers)

    local function try_attach_parser(buf, lang)
      if not vim.treesitter.language.add(lang) then return end
      vim.treesitter.start(buf, lang)
    end

    local available_parsers = require('nvim-treesitter').get_available()
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local buf, filetype = args.buf, args.match
        
        local lang = vim.treesitter.language.get_lang(filetype)
        if not lang then return end

        local installed_parsers = require('nvim-treesitter').get_installed('parsers')

        if vim.tbl_contains(installed_parsers, lang) then
          -- enable the parser if it is installed
          try_attach_parser(buf, lang)
        elseif vim.tbl_contains(available_parsers, lang) then
          -- if a parser is available in `nvim-treesitter` auto install it, and enable it after the installation is done
          require('nvim-treesitter').install(lang):await(function() try_attach_parser(buf, lang) end)
        else
          -- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
          try_attach_parser(buf, lang)
        end
      end,
    })
  end
}
