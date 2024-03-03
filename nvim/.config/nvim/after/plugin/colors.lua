require('rose-pine').setup({
    disable_background = true
})
require('tokyonight').setup({
    disable_background = true
})

function ColorMyPencils(color) 
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- Set line number colors.
    if color ~= "rose-pine" then
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#9ba4cf', bold=false})
        vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#9ba4cf', bold=false})
    end

    print("Pencils colored in '" .. color .. "'!")
end

-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
end


ColorMyPencils('tokyonight-storm')
-- Uncomment to add spacy line number colorings.
--LineNumberColors()
