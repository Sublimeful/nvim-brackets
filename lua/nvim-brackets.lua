local M = {}

M.Pairs = {}
M.Pairs['{'] = '}'

M.GetLeftChar = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col)
end

M.GetRightChar = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col + 1, col + 1)
end

M.Enter = function()
  local left_char = M.GetLeftChar()
  local right_char = M.GetRightChar()

  if M.Pairs[left_char] == right_char then
    return vim.api.nvim_replace_termcodes('<CR><Tab><BS><CR><Up><Tab>', true, false, true)
  end

  return vim.api.nvim_replace_termcodes('<CR>', true, false, true)
end

vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.nvim_brackets.Enter()', { expr = true, noremap = true })

_G.nvim_brackets = M
return M
