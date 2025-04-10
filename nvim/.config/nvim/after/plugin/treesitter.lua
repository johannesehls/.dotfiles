require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
	  "asm",
	  "bash",
	  "bibtex",
	  "c",
	  "cmake",
	  "cpp",
	  "css",
	  "csv",
	  "disassembly",
	  "dockerfile",
	  "doxygen",
	  "git_config",
	  "git_rebase",
	  "gitattributes",
	  "gitcommit",
	  "gitignore",
	  "go",
	  "haskell",
	  "html",
	  "java",
	  "javascript",
	  "json",
	  --"latex",
	  "linkerscript",
	  "llvm",
	  "lua",
	  "make",
	  "markdown",
	  "nasm",
	  "nix",
	  "objdump",
	  "perl",
	  "php",
	  "python",
	  "regex",
	  "ruby",
	  "rust",
	  "scss",
	  "sql",
	  "ssh_config",
	  "tmux",
	  "typescript",
	  "vim",
	  "xml",
	  "yaml",
	  "zathurarc",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- Needed to use VimTex along with treesitter.
  ignore_install = { "latex" },  -- Ignore LaTeX

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,

    disable = { "latex" },  -- Disable Tree-sitter for LaTeX to use VimTex, because we use vimtex instead.
  },
}
