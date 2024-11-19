local opt = vim.opt

opt.foldlevel = 20
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldcolumn = '1'
opt.foldlevelstart = -1
opt.foldenable = false

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.g.lazyvim_statuscolumn = {
  folds_open = true,
  folds_githl = true,
}
