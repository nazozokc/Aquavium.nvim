# AGENT.md

## 概要

このリポジトリは **Neovim 用カラースキーム Aquavium.nvim** の実装を管理するためのもの。  
本ドキュメントは、人間・AI を問わず、このリポジトリに変更を加える際の **設計方針・責務分離・禁止事項** を明確にする目的で用意されている。

---

## 基本方針

- Aquavium.nvim は **シンプル・分離・再利用可能** を最優先とする
- 色定義・highlight 定義・プラグイン連携を混在させない
- `vim.api.nvim_set_hl()` を直接乱用しない
- highlight 適用は **必ず utils.apply_hl() を経由**する

---

## エントリポイントと責務

### colors/Aquavium.lua

- **唯一の Vim colorscheme エントリ**
- やることは以下のみ
  - `require("Aquavium").setup()` を呼ぶ
- ロジック・色定義・条件分岐は禁止

---

### lua/Aquavium/init.lua

**役割**
- カラースキームの中核
- 以下を管理する

**責務**
- カラーパレット定義
- 標準 highlight グループ定義
- autocommand の登録
- integrations / lualine の適用制御

**禁止事項**
- plugin 個別の highlight を直接書くこと
- utils を経由しない highlight 適用

---

## utils.lua のルール

### lua/Aquavium/utils.lua

**目的**
- highlight 適用の共通インターフェース

**原則**
- highlight は **テーブル定義 → apply_hl()** の流れを崩さない
- `vim.api.nvim_set_hl()` を直接呼ぶのは utils 内のみ

```lua
apply_hl({
  GroupName = { fg = "...", bg = "...", bold = true },
})
````

この形式を厳守。

---

## integrations の設計ルール

### lua/Aquavium/integrations/

#### init.lua

* 各連携モジュールの **apply() を呼ぶだけ**
* 条件分岐（プラグインが存在するか）はここで行う

#### 個別連携モジュール

* bufferline.lua
* markview.lua
* treesitter_context.lua

**ルール**

* `require("Aquavium.utils")` を必ず使用
* highlight 定義以外の処理は禁止
* Neovim API を直接触らない

---

## lualine テーマ

### lua/lualine/themes/Aquavium.lua

**役割**

* lualine 専用テーマ定義

**ルール**

* `require("Aquavium")` から色を取得する
* 独自に色パレットを持たない
* 他プラグインの設定に依存しない

---

## 依存関係の考え方

* 必須依存は **Neovim 0.8+ のみ**
* plugin 連携は **完全オプション**
* 連携プラグインが無くてもエラーを出さないこと

---

## 追加・変更時のチェックリスト

変更を加える前に必ず確認すること：

* [ ] colors/Aquavium.lua にロジックを書いていないか
* [ ] highlight を utils.apply_hl() 経由で適用しているか
* [ ] integrations に責務外の処理を書いていないか
* [ ] init.lua が肥大化していないか
* [ ] plugin 非導入環境で壊れないか

---

## 禁止事項まとめ

❌ 以下はやらない

* highlight の直書き乱用
* integrations から別 integrations を呼ぶ
* utils を通さない API 直接操作
* colorscheme 読み込み時に重い処理をする
* optional plugin を必須前提で扱う

---

## この AGENT.md の扱い

* このドキュメントは **仕様の一部**
* 実装が AGENT.md と矛盾した場合、**実装側を修正する**
* 設計変更が必要な場合は、先に AGENT.md を更新する

---

以上。
