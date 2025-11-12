local M = {}

function M.replace_words()
  vim.ui.input({ prompt = "Enter Old Word: " }, function(old_word)
    if not old_word or old_word == "" then
      return
    end
    vim.ui.input({ prompt = "Enter New Word: " }, function(new_word)
      if not new_word or new_word == "" then
        return
      end
      vim.cmd(":%s/" .. old_word .. "/" .. new_word .. "/gc")
      print("Replaced '" .. old_word .. "' with '" .. new_word .. "'")
    end)
  end)
end

return M
