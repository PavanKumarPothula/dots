return { 'nvim-mini/mini.surround', version = '*',  lazy=false,
opts = {
    mappings = {
      add = "msa",            -- Add surrounding
      delete = "msd",         -- Delete surrounding
      replace = "msr",        -- Replace surrounding
      -- find, highlight, etc.
    },
  },
}
