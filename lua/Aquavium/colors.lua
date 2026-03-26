local palette = {
    bg1 =       "#000e1e",
    bg2 =       "#000e1e",
    fg =        "#cdd5e5",
    red =       "#cc0047",
    green =     "#73bf5e",
    blue =      "#004584",
    lightblue = "#4fbee3",
    cyan =      "#63deff",
    sky =       "#699ee0",
    orange =    "#fdba8a",
    yellow =    "#e8dfad",
    purple =    "#938af8",
    pink =      "#eeb6c7",
    rose =      "#da9197",
    gray =      "#7b92ae",
}

local M = {}

function M.setup(opts)
    local c = vim.deepcopy(palette)

    if opts.transparent then
        c.bg1 = "NONE"
    end

    return {
        colors = c
    }
end

return M
