# CHANGE-lualine.md

## 変更内容

### 変更前

```lua
local function apply_lualine()
    if not package.loaded["lualine"] then
        return
    end

    vim.schedule(function()
        local ok, lualine = pcall(require, "lualine")
        if not ok then return end

        local config = lualine.get_config() or {}
        config.options = config.options or {}
        config.options.theme = "Aquavium"

        package.loaded["lualine.themes.Aquavium"] = nil

        lualine.setup(config)
        lualine.refresh()
    end)
end
```

### 変更後

```lua
local function apply_lualine()
    if not package.loaded["lualine"] then
        return
    end

    local ok, lualine = pcall(require, "lualine")
    if not ok then return end

    local config = lualine.get_config() or {}
    config.options = config.options or {}

    package.loaded["lualine.themes.Aquavium"] = nil
    config.options.theme = require("lualine.themes.Aquavium")

    lualine.setup(config)
    lualine.refresh()
end
```

## 変更のポイント

1. **`vim.schedule()` の削除**: 非同期処理だったものを同期処理に変更
2. **テーマの読み込み方法の変更**: 文字列 `"Aquavium"` から直接 `require("lualine.themes.Aquavium")` に変更

## 原因

元のコードでは `vim.schedule()` により非同期でテーマを適用しようとしていました。これにより、テーマファイル (`lua/lualine/themes/Aquavium.lua`) が読み込まれる時点で `require("Aquavium").colors` がまだ nil の場合があり.theme が正しく適用されませんでした。

同期処理に変更し、直接 require することで、 colors が設定された後に確実にテーマが読み込まれるようにしました。
