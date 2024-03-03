function CommentLines()
    local comment = "--"
    local filetype = vim.bo.filetype

    if filetype == "python" then
        comment = "#"
    elseif filetype == "c" or filetype == "cpp" then
        comment = "//"
    elseif filetype == "rust" then
        comment = "//"
    elseif filetype == "go" then
        comment = "//"
    elseif filetype == "javascript" then
        comment = "//"
    elseif filetype == "lua" then
	comment = "--"
    else
        print("Unsupported programming language..")
        return
    end

    local mapComment = string.format(":<C-u>silent execute \"'<,'>s/^/%s/\" | :nohlsearch<CR>", comment)
    vim.api.nvim_set_keymap('x', '<C-_>', mapComment, { noremap = true, silent = true })

    local mapUncomment = string.format(":<C-u>silent execute \"'<,'>s/^%s//\" | :nohlsearch<CR>", comment)
    vim.api.nvim_set_keymap('x', '<C-\\>', mapUncomment, { noremap = true, silent = true })
end

CommentLines()
