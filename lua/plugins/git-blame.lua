-- Git Blame
return {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    enabled = false, -- disable by default, enabled only on keymap
    date_format = '%d/%m/%y %H:%M:%S', -- more concise date format
  }
}

