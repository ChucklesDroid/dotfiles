return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	event = "BufReadPre",
    opts = {
        ensure_installed = {
            "gopls",
        },
    },
	config = {
	    ui = {
		icons = {
		    package_installed = "✓",
		    package_pending = "➜",
		    package_uninstalled = "✗"
		}
	    }
	}
}
