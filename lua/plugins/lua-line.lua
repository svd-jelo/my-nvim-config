return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	virtual_env = function()
		-- only show virtual env for Python
		if vim.bo.filetype ~= "python" then
			return ""
		end

		local conda_env = os.getenv("CONDA_DEFAULT_ENV")
		local venv_path = os.getenv("VIRTUAL_ENV")

		if venv_path == nil then
			if conda_env == nil then
				return ""
			else
				return string.format("  %s (conda)", conda_env)
			end
		else
			local venv_name = vim.fn.fnamemodify(venv_path, ":t")
			return string.format("  %s (venv)", venv_name)
		end
	end,

	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula",
			},
			lualine_b = {
				"branch",
				{
					virtual_env,
				},
			},
		})
	end,
}
