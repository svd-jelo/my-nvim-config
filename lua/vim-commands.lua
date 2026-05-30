vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

--- Run python in terminal
local terminal_buf = nil
local terminal_win = nil

vim.keymap.set("n", "<F5>", function()
	local file = vim.fn.expand("%:p")

	local function get_python()
		--- 1. venv
		if vim.env.VIRTUAL_ENV then
			return vim.env.VIRTUAL_ENV .. "/bin/python"
		end

		--- 2. conda
		if vim.env.CONDA_PREFIX then
			return vim.env.CONDA_PREFIX .. "/bin/python"
		end

		--- 3. fallback
		return "python3"
	end

	local python = get_python()

	-- Create terminal if it doesn't exist
	if terminal_buf == nil or not vim.api.nvim_buf_is_valid(terminal_buf) then
		vim.cmd("botright 15split")
		vim.cmd("terminal")

		terminal_buf = vim.api.nvim_get_current_buf()
		terminal_win = vim.api.nvim_get_current_win()
	end

	-- Reopen window if user closed it
	if terminal_win == nil or not vim.api.nvim_win_is_valid(terminal_win) then
		vim.cmd("botright 15split")
		vim.api.nvim_win_set_buf(0, terminal_buf)

		terminal_win = vim.api.nvim_get_current_win()
	end

	-- Send command to terminal
	local job_id = vim.b[terminal_buf].terminal_job_id

	vim.fn.chansend(job_id, "clear\n")
	vim.fn.chansend(job_id, python .. " " .. vim.fn.shellescape(file) .. "\n")
	vim.fn.chansend(job_id, python .. " -c \"import sys; print('Python:', sys.executable)\"; ")
	-- Focus terminal
	vim.api.nvim_set_current_win(terminal_win)
	vim.cmd("startinsert")
end, { desc = "Run Python in reusable terminal" })
