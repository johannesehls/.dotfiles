-- Create global variable for toggling zathura sync
local zathura_sync_on_cursorhold = false

vim.g.maplocalleader = "\\"

-- " This is necessary for VimTeX to load properly. The "indent" is optional.
-- " Note: Most plugin managers will do this automatically!
--vim.cmd('filetype plugin indent on')

-- This enables Vim's and neovim's syntax-related features. Without this, some
-- VimTeX features will not work (see ":help vimtex-requirements" for more
-- info).
-- Note: Most plugin managers will do this automatically!
--vim.cmd('syntax enable')

-- Viewer options
vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_view_general_options = '--unique --no-raise file:@pdf\\#src:@line@tex'

-- Keep zathura from steeling focus of neovim with vimtex.
vim.g.xwindow_id = vim.fn.system('xdotool getactivewindow')

-- Compiler backend (default is latexmk)
vim.g.vimtex_compiler_method = 'latexmk'

-- Enables SyncTeX forward search when you first open the PDF.
vim.g.vimtex_view_forward_search_on_start = 1

-- The autocommand triggers \lv (VimtexView) whenever you pause (CursorHold) while moving in a .tex file.
-- This means that as you scroll or pause in Neovim, Zathura will follow and highlight the corresponding PDF location.
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*.tex",
  callback = function()
    if zathura_sync_on_cursorhold then
      vim.cmd("VimtexView")
      vim.fn.system('sleep 0.04') -- Adds little delay to ensure zathura has focus first, then fire the xdotool cmd.
      vim.fn.system('xdotool windowactivate ' .. vim.g.xwindow_id .. ' --sync')
    end
  end,
})

-- keymap for toggling zathura sync
vim.keymap.set("n", "<localleader>tzs", function() 
  zathura_sync_on_cursorhold = not zathura_sync_on_cursorhold 
  print("Sync on CursorHold is now: " .. (zathura_sync_on_cursorhold and "enabled" or "disabled"))
end)
