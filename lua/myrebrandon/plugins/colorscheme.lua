return {
	"fraeso/xcodedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("xcodedark").setup({
      transparent = true,
			integrations = {
				telescope = true,
				nvim_tree = true,
				gitsigns = true,
				bufferline = true,
				incline = true,
				lazygit = true,
				which_key = true,
				notify = true,
				snacks = true,
				blink = true,
			},
      color_overrides = {
        cursor = "#ffffff",
      },
			terminal_colors = true,
		})

		vim.cmd.colorscheme("xcodedark")

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = '#000000' })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

    local border_color = "#00ffff"
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = border_color, bg = "none" })
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = border_color, bg = "none" })
		vim.api.nvim_set_hl(0, "VertSplit", { fg = border_color, bg = "none" })

    -- Hovered word highlight
    vim.api.nvim_set_hl(0, "LspReferenceText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "LspReferenceRead", { link = "Visual" })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { link = "Visual" })
	end,
}
