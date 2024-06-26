return {

  -- depends on the git extra for highlighting and auto-completion of github issues/prs
  { import = "lazyvim.plugins.extras.lang.git" },

  -- Octo
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    init = function()
      vim.treesitter.language.register("markdown", "octo")
    end,
    opts = {
      enable_builtin = true,
      default_to_projects_v2 = true,
      default_merge_method = "squash",
      picker = "telescope",
    },
    keys = {
      { "<leader>gi", "<cmd>Octo issue list<CR>", desc = "List Isues (Octo)" },
      { "<leader>gI", "<cmd>Octo issue search<CR>", desc = "Search Isues (Octo)" },
      { "<leader>gp", "<cmd>Octo pr list<CR>", desc = "List PRs (Octo)" },
      { "<leader>gP", "<cmd>Octo pr search<CR>", desc = "Search PRs (Octo)" },
      { "<leader>gr", "<cmd>Octo repo list<CR>", desc = "List Repos (Octo)" },
      { "<leader>gS", "<cmd>Octo search<CR>", desc = "Search (Octo)" },
      { "<leader>a", "", desc = "+assignee (Otco)", ft = "octo" },
      { "<leader>c", "", desc = "+comment/code (Otco)", ft = "octo" },
      { "<leader>l", "", desc = "+label (Otco)", ft = "octo" },
      { "<leader>i", "", desc = "+issue (Otco)", ft = "octo" },
      { "<leader>r", "", desc = "+react (Otco)", ft = "octo" },
      { "<leader>p", "", desc = "+pr (Otco)", ft = "octo" },
      { "<leader>v", "", desc = "+review (Otco)", ft = "octo" },
      { "@", "@<C-x><C-o>", mode = "i", ft = "octo", silent = true },
      { "#", "#<C-x><C-o>", mode = "i", ft = "octo", silent = true },
    },
  },

  -- Octo Picker
  {
    "pwntester/octo.nvim",
    opts = function(_, opts)
      if LazyVim.has("telescope.nvim") then
        opts.picker = "telescope"
      elseif LazyVim.has("fzf-lua") then
        opts.picker = "fzf-lua"
      else
        LazyVim.error("`octo.nvim` requires `telescope.nvim` or `fzf-lua`")
      end
    end,
  },
}
