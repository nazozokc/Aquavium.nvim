local utils = require("Aquavium.utils")
local M = {}

function M.apply(c, opts)
    local hl = {
        -- Notifier
        SnacksNotifierInfo    = { fg = c.lightblue },
        SnacksNotifierWarn    = { fg = c.yellow },
        SnacksNotifierError   = { fg = c.rose },
        SnacksNotifierDebug   = { fg = c.pink },
        SnacksNotifierTrace   = { fg = c.gray },

        SnacksNotifierBorderInfo  = { link = "SnacksNotifierInfo" },
        SnacksNotifierBorderWarn  = { link = "SnacksNotifierWarn" },
        SnacksNotifierBorderError = { link = "SnacksNotifierError" },
        SnacksNotifierBorderDebug = { link = "SnacksNotifierDebug" },
        SnacksNotifierBorderTrace = { link = "SnacksNotifierTrace" },

        SnacksNotifierTitleInfo   = { link = "SnacksNotifierInfo" },
        SnacksNotifierTitleWarn   = { link = "SnacksNotifierWarn" },
        SnacksNotifierTitleError  = { link = "SnacksNotifierError" },
        SnacksNotifierTitleDebug  = { link = "SnacksNotifierDebug" },
        SnacksNotifierTitleTrace  = { link = "SnacksNotifierTrace" },

        SnacksNotifierIconInfo    = { link = "SnacksNotifierInfo" },
        SnacksNotifierIconWarn    = { link = "SnacksNotifierWarn" },
        SnacksNotifierIconError   = { link = "SnacksNotifierError" },
        SnacksNotifierIconDebug   = { link = "SnacksNotifierDebug" },
        SnacksNotifierIconTrace   = { link = "SnacksNotifierTrace" },

        -- Dashboard
        SnacksDashboardHeader  = { fg = c.cyan, bold = opts.bold },
        SnacksDashboardFooter  = { fg = c.gray },
        SnacksDashboardDesc    = { fg = c.fg },
        SnacksDashboardKey     = { fg = c.yellow },
        SnacksDashboardIcon    = { fg = c.lightblue },
        SnacksDashboardSpecial = { fg = c.purple },
        SnacksDashboardDir     = { fg = c.gray },

        -- Picker
        SnacksPickerBorder         = { fg = c.gray },
        SnacksPickerTitle          = { fg = c.cyan },
        SnacksPickerMatch          = { fg = c.yellow },
        SnacksPickerListCursorLine = { fg = c.fg },
        SnacksPickerPreviewTitle   = { fg = c.lightblue },

        -- Indent
        SnacksIndent      = { fg = c.blue },
        SnacksIndentScope = { fg = c.gray },
    }

    utils.apply_hl(hl)
end

return M
