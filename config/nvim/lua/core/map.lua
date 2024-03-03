vim.cmd([[nnoremap <C-r> :lua Run()<CR>]])
vim.cmd([[nnoremap <C-s> :w!<CR>]])
vim.cmd([[nnoremap <C-q> :q<CR>]])
vim.cmd([[nnoremap <C-x> :x<CR>]])
vim.cmd([[nnoremap g gg]])

--vim.cmd([[vnoremap <silent> <leader>c :s/^/#/<CR>:nohl<CR>]])
--vim.cmd([[vnoremap <silent> <leader>u :s/^#//<CR>:nohl<CR>]])
-- vim.cmd([[nnoremap <silent><c-n> :NvimTreeToggle<CR>]])
-- vim.cmd([[nnoremap <silent><TAB> :bnext<CR>]])


-- vim.api.nvim_set_keymap('x', '<C-_>', [[:<C-u>silent execute "'<,'>s/^/#/" | nohlsearch<CR>]], { noremap = true, silent = true })
