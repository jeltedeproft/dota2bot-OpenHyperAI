-- SettingsNeutralItemTable.lua
-- Re-exports the shared neutral item pool for FretBots mode.
-- Edit item lists in bots/FunLib/neutral_item_pool.lua — not here.

local pool = require('bots.FunLib.neutral_item_pool')

return {
	items        = pool.items,
	enhancements = pool.enhancements,
}
