local codeium_enabled = true

local function setup_codeium()
    require("codeium").setup({
        -- Optionally disable cmp source if using virtual text only
        enable_cmp_source = false,
        virtual_text = {
            enabled = codeium_enabled,

            -- These are the defaults

            -- Set to true if you never want completions to be shown automatically.
            manual = false,
            -- A mapping of filetype to true or false, to enable virtual text.
            filetypes = {},
            -- Whether to enable virtual text of not for filetypes not specifically listed above.
            default_filetype_enabled = true,
            -- How long to wait (in ms) before requesting completions after typing stops.
            idle_delay = 75,
            -- Priority of the virtual text. This usually ensures that the completions appear on top of
            -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
            -- desired.
            virtual_text_priority = 65535,
            -- Set to false to disable all key bindings for managing completions.
            map_keys = true,
            -- The key to press when hitting the accept keybinding but no completion is showing.
            -- Defaults to \t normally or <c-n> when a popup is showing. 
            accept_fallback = nil,
            -- Key bindings for managing completions in virtual text mode.
            key_bindings = {
                -- Accept the current completion.
                accept = "<Tab>",
                -- Accept the next word.
                accept_word = "<M-i>",
                -- Accept the next line.
                accept_line = "<M-l>",
                -- Clear the virtual text.
                clear = "<M-o>",
                -- Cycle to the next completion.
                next = "<M-8>",
                -- Cycle to the previous completion.
                prev = "<M-9>",
            }
        }
    })
end

-- Call setup function
setup_codeium()

function ToggleCodeium()
    codeium_enabled = not codeium_enabled
    setup_codeium()
    print("Codeium is now " .. (codeium_enabled and "enabled" or "disabled") .. "!")
end

-- keymap for toggling codeium
vim.keymap.set("n", "<leader>tc", function() ToggleCodeium() end)
