require( GetScriptDirectory()..'/FunLib/aba_global_overrides' )
local Role = require( GetScriptDirectory()..'/FunLib/aba_role' )

local Item = {}

local tSpecifiedItemIndex = {

	["item_tpscroll"] = true,
	["item_travel_boots"] = true,
	["item_travel_boots_2"] = true,
	["item_blink"] = true,
	["item_black_king_bar"] = true,
	["item_manta"] = true,
	["item_force_staff"] = true,

}

local sNeedDebugItemList =
{
	"item_mango_tree",
--	"item_iron_talon",
	"item_arcane_ring",
	"item_royal_jelly",
	"item_trusty_shovel",
	"item_clumsy_net",
	"item_essence_ring",
	"item_repair_kit",
	"item_greater_faerie_fire",
--	"item_spider_legs",
	"item_flicker",
	"item_ninja_gear",
	"item_illusionsts_cape",
	"item_havoc_hammer",
	"item_minotaur_horn",
	"item_force_boots",
	"item_woodland_striders",
	"item_fallen_sky",
	"item_ex_machina",

	"item_abyssal_blade",
	"item_ancient_janggo",
--	"item_arcane_boots",
	"item_armlet",
--	"item_bfury",
	"item_black_king_bar",
	"item_blade_mail",
	"item_blink",
	"item_bloodstone",
	"item_bloodthorn",
	"item_bottle",
--	"item_clarity",
	"item_crimson_guard",
	"item_cyclone",
	"item_dagon",
	"item_dagon_2",
	"item_dagon_3",
	"item_dagon_4",
	"item_dagon_5",
	"item_diffusal_blade",
	"item_enchanted_mango",
	"item_ethereal_blade",
--	"item_faerie_fire",
	"item_flask",
	"item_force_staff",
	"item_ghost",
	"item_glimmer_cape",
	"item_guardian_greaves",
--	"item_hand_of_midas",
	"item_heavens_halberd",
	"item_helm_of_the_dominator",
--	"item_hood_of_defiance",
	"item_hurricane_pike",
	"item_invis_sword",
	"item_lotus_orb",
--	"item_magic_stick",
--	"item_magic_wand",
	"item_manta",
--	"item_mask_of_madness",
--	"item_medallion_of_courage", -- removed from game
	"item_mekansm",
	"item_meteor_hammer",
	"item_mjollnir",
	"item_moon_shard",
	"item_necronomicon",
	"item_necronomicon_2",
	"item_necronomicon_3",
	"item_nullifier",
	"item_orchid",
--	"item_phase_boots",
	"item_pipe",
--	"item_power_treads",
--	"item_quelling_blade",
	"item_refresher",
	"item_refresher_shard",
--	"item_ring_of_basilius",
	"item_rod_of_atos",
	"item_satanic",
--	"item_shadow_amulet",
	"item_sheepstick",
	"item_shivas_guard",
	"item_silver_edge",
	"item_solar_crest",
	"item_sphere",
	"item_spirit_vessel",
--	"item_tango",
--	"item_tango_single",
	"item_tome_of_knowledge",
	"item_tpscroll",
--	"item_travel_boots",
--	"item_travel_boots_2",
	"item_urn_of_shadows",
	"item_veil_of_discord",
}

local tDebugItemList = {}
for _, sItemName in pairs( sNeedDebugItemList )
do
	tDebugItemList[sItemName] = true
end

Item['sBasicItems'] = {
	'item_aegis',
	'item_boots_of_elves',
	'item_belt_of_strength',
	'item_blade_of_alacrity',
	'item_blades_of_attack',
	'item_blight_stone',
	'item_blink',
	'item_boots',
	'item_bottle',
	'item_branches',
	'item_broadsword',
	'item_chainmail',
	'item_cheese',
	'item_circlet',
	'item_clarity',
	'item_claymore',
	'item_cloak',
	'item_crown',
	'item_demon_edge',
	'item_dust',
	'item_eagle',
	'item_enchanted_mango',
	'item_energy_booster',
	'item_faerie_fire',
	'item_flask',
	'item_gauntlets',
	'item_gem',
	'item_ghost',
	'item_gloves',
	'item_holy_locket',
	'item_hyperstone',
	'item_infused_raindrop',
	'item_javelin',
	'item_lifesteal',
	'item_magic_stick',
	'item_mantle',
	'item_mithril_hammer',
	'item_mystic_staff',
	'item_ogre_axe',
	'item_orb_of_frost',
	'item_platemail',
	'item_point_booster',
	'item_quarterstaff',
	'item_quelling_blade',
	'item_reaver',
	'item_refresher_shard',
	'item_ring_of_health',
	'item_ring_of_protection',
	'item_ring_of_regen',
	'item_robe',
	'item_relic',
	'item_sobi_mask',
	'item_shadow_amulet',
	'item_slippers',
	'item_smoke_of_deceit',
	'item_staff_of_wizardry',
	'item_talisman_of_evasion',
	'item_tango',
	'item_tango_single',
	'item_tome_of_knowledge',
	'item_tpscroll',
	'item_ultimate_orb',
	'item_vitality_booster',
	'item_void_stone',
	'item_wind_lace',
	'item_ward_observer',
	'item_ward_sentry',
	'item_blitz_knuckles', --闪电指套
	'item_voodoo_mask', --巫毒面具
	'item_fluffy_hat', --毛毛帽
	'item_blood_grenade',
	'item_wizard_hat',
	'item_chasm_stone',
	'item_splintmail',
	'item_shawl',
}

Item['sSeniorItems'] = {

	'item_arcane_boots',
	'item_buckler',
	'item_basher',
	'item_dagon',
	'item_dagon_2',
	'item_dagon_3',
	'item_dagon_4',
	'item_dragon_lance',
	'item_force_staff',
	'item_headdress',
--	'item_hood_of_defiance', -- removed from game
	'item_invis_sword',
	'item_kaya',
	'item_lesser_crit',
	'item_maelstrom',
--	'item_medallion_of_courage', -- removed from game
	'item_mekansm',
--	'item_necronomicon', -- removed from game
--	'item_necronomicon_2', -- removed from game
	'item_essence_distiller',
	'item_specialists_array',
	'item_ring_of_basilius',
	'item_sange',
	'item_soul_booster',
	'item_travel_boots',
	'item_urn_of_shadows',
	'item_vanguard',
	'item_yasha',
	
	'item_rod_of_atos',
	'item_blink',
	'item_cyclone',
	'item_helm_of_the_dominator',
	'item_rod_of_atos',

}

Item['sTopItems'] = {

	'item_clarity',
	'item_tango',
	'item_flask',
	'item_faerie_fire',
	'item_enchanted_mango',
	'item_infused_raindrop',
	'item_blood_grenade',

	'item_abyssal_blade',
	'item_aether_lens',
	'item_armlet',
	'item_assault',
	'item_ancient_janggo',
	'item_aeon_disk',
	'item_bfury',
	'item_black_king_bar',
	'item_blade_mail',
	'item_bloodstone',
	'item_bloodthorn',
	'item_bottle',
	'item_bracer',
	'item_butterfly',
	'item_crimson_guard',
	'item_dagon_5',
	'item_desolator',
	'item_diffusal_blade',
	'item_echo_sabre',
	'item_ethereal_blade',
	'item_gem',
	'item_glimmer_cape',
	'item_guardian_greaves',
	'item_greater_crit',
	'item_hand_of_midas',
	'item_heart',
	'item_heavens_halberd',
	'item_hurricane_pike',
	'item_holy_locket',
	'item_kaya_and_sange',
	'item_lotus_orb',
	'item_manta',
	'item_mask_of_madness',
	'item_mjollnir',
	'item_monkey_king_bar',
	'item_moon_shard',
	'item_meteor_hammer',
--	'item_necronomicon_3', -- removed from game
	'item_null_talisman',
	'item_nullifier',
	'item_orb_of_frost',
	'item_phase_boots',
	'item_pipe',
	'item_power_treads',
	'item_radiance',
	'item_rapier',
	'item_refresher',
	'item_sange_and_yasha',
	'item_satanic',
	'item_sheepstick',
	'item_sphere',
	'item_shivas_guard',
	'item_silver_edge',
	'item_solar_crest',
	'item_soul_ring',
	'item_skadi',
	'item_spirit_vessel',
	'item_tpscroll',
	'item_tranquil_boots',
	'item_travel_boots_2',
	'item_veil_of_discord',
	'item_vladmir',
	'item_wraith_band',
	'item_yasha_and_kaya',
	
	'item_revenants_brooch',
	'item_boots_of_bearing',
--	'item_wraith_pact', -- removed from game

	'item_essence_distiller',
	'item_specialists_array',
	'item_hydras_breath',
	'item_consecrated_wraps',
	'item_crellas_crozier',
}

local tTopItemList = {}
for _, sItem in pairs( Item['sTopItems'] )
do
	tTopItemList[sItem] = true
end

Item['tEarlyItem'] = {
	 'item_clarity',
	 'item_faerie_fire',
	 'item_tango',
	 'item_flask',
	 'item_infused_raindrop',
	 -- 'item_magic_stick',
	 -- 'item_orb_of_frost',
	 'item_bracer',
	 'item_wraith_band',
	 'item_null_talisman',
	 'item_bottle',
	 'item_soul_ring',
	 -- 'item_magic_wand',
	 -- 'item_ancient_janggo',
	 'item_refresher_shard',
	 'item_cheese',
	 'item_blood_grenade',
	 'item_branches',
	 'item_gauntlets',
	 'item_slippers',
	 'item_circlet',
	 'item_mantle',
}

Item['tEarlyConsumableItem'] = {
	 'item_clarity',
	 'item_faerie_fire',
	 'item_tango',
	 'item_enchanted_mango',
	 'item_flask',
	 'item_infused_raindrop',
	 'item_magic_stick',
	 'item_quelling_blade', -- for bf.
	 'item_branches',
	 -- 'item_magic_wand',
	 'item_blood_grenade',
	 'item_gauntlets',
	 'item_slippers',
	 'item_circlet',
	 'item_mantle',
	 'item_magic_wand',
	 'item_recipe_magic_wand',
	 'item_magic_stick',
	 'item_smoke_of_deceit'
	--  'item_dust',
	--  'item_ward_sentry',
	--  'item_ward_observer',
}

Item['tEarlyBoots'] = {
	'item_boots',
	'item_phase_boots',
	'item_power_treads',
	'item_tranquil_boots',
	'item_arcane_boots'
}

Item['sCanNotSwitchItems'] = {
		'item_aegis',
		'item_refresher_shard',
		'item_cheese',
		'item_bloodstone',
		'item_gem',
		'item_moon_shard',
		'item_black_king_bar', -- prevent keep swapping with critical items in other settings
		-- 'item_ward_sentry', -- prevent keep swapping with critical items in other settings
}

Item['sSellList'] = {
	"item_black_king_bar",
	"item_quelling_blade",

	"item_ultimate_scepter",
	"item_magic_wand",

	"item_cyclone",
	"item_magic_wand",

	"item_shivas_guard",
	'item_magic_wand',

	"item_lotus_orb",
	"item_quelling_blade",

	"item_assault",
	"item_magic_wand",

	"item_assault",
	"item_quelling_blade",

	"item_assault",
	"item_orb_of_corrosion",

	"item_travel_boots",
	"item_magic_wand",

	"item_travel_boots",
	"item_phase_boots",

	"item_travel_boots_2",
	"item_phase_boots",

	"item_travel_boots",
	"item_arcane_boots",

	"item_assault",
	"item_ancient_janggo",

	"item_vladmir",
	"item_magic_wand",

	"item_solar_crest",
	"item_pavise",

	"item_boots_of_bearing",
	"item_drum_of_endurance",

	"item_spirit_vessel",
	"item_urn_of_shadows",

	"item_magic_wand",
	"item_recipe_magic_wand",
	
	-- ... existing entries ...
    'item_splintmail', 'item_chainmail',
    'item_shawl', 'item_cloak',
    'item_wizard_hat', 'item_circlet',
}

local tCanNotSwitchItemList = {}
for _, sItem in pairs( Item['sCanNotSwitchItems'] )
do
	tCanNotSwitchItemList[sItem] = true
end


local sConsumableList = {

	'item_clarity',
	'item_tango',
	'item_flask',
	'item_faerie_fire',
	'item_enchanted_mango',
	'item_infused_raindrop',
	'item_blood_grenade',

	'item_mango_tree',
	'item_royal_jelly',
	'item_greater_faerie_fire',
	"item_repair_kit",

	'item_cheese',
	'item_refresher_shard',
	'item_aegis',

}
local tConsumableItemList = {}
for _, sItem in pairs( sConsumableList )
do
	tConsumableItemList[sItem] = true
end

local sNotSellItemList = {
	'item_abyssal_blade',
	'item_assault',
	'item_black_king_bar',
	'item_bloodstone',
	'item_bloodthorn',
	'item_butterfly',
	'item_bfury',
	'item_cheese',
	'item_crimson_guard',
	'item_pipe',
	'item_dust',
	'item_gem',
	'item_greater_crit',
	'item_guardian_greaves',
	'item_heart',
	'item_heavens_halberd',
	'item_hyperstone',
	'item_manta',
	'item_hurricane_pike',
	'item_mjollnir',
	'item_nullifier',
	'item_octarine_core',
	'item_radiance',
	'item_rapier',
	'item_refresher',
	'item_refresher_shard',
	'item_satanic',
	'item_sheepstick',
	'item_shivas_guard',
	'item_silver_edge',
	'item_skadi',
	'item_sphere',
	'item_ultimate_scepter',
	'item_travel_boots',
	'item_travel_boots_2',
	'item_ward_observer',
}
local tNotSellItemList = {}
for _, sItem in pairs( sNotSellItemList )
do
	tNotSellItemList[sItem] = true
end



local tSmallItemList = {

	['item_tpscroll'] = 1,
	['item_flask'] = 1,
	['item_enchanted_mango'] = 1,

}


function Item.GetComponentList( itemName )

	local componentList = {}
	local rawItemComponentTable = GetItemComponents( itemName )

	if #rawItemComponentTable == 0
	then
		componentList = { itemName }
	else
		local itemComponentList = rawItemComponentTable[1]
		for _, v in pairs( itemComponentList )
		do
			componentList[#componentList + 1] = v
		end	
	end
	
	return componentList
	
end



require( GetScriptDirectory()..'/FunLib/aba_item_components' )(Item)



------------------------------------------------------------------------------------------------------
--Self_Define Item
------------------------------------------------------------------------------------------------------
local tDefineItemRealName = {

['item_double_tango'] = "item_tango",
['item_double_clarity'] = "item_clarity",
['item_double_flask'] = "item_flask",
['item_double_enchanted_mango'] = "item_enchanted_mango",


['item_broken_satanic'] = "item_satanic",


['item_power_treads_agi'] = "item_power_treads",
['item_power_treads_int'] = "item_power_treads",
['item_power_treads_str'] = "item_power_treads",



['item_mid_outfit'] = "item_power_treads",
['item_medusa_outfit'] = "item_power_treads",
['item_templar_assassin_outfit'] = "item_power_treads",


['item_ranged_carry_outfit'] = "item_power_treads",
['item_melee_carry_outfit'] = "item_power_treads",
['item_phantom_assassin_outfit'] = "item_power_treads",
['item_juggernaut_outfit'] = "item_phase_boots",
['item_huskar_outfit'] = "item_phase_boots",
['item_sven_outfit'] = "item_phase_boots",
['item_bristleback_outfit'] = "item_power_treads",


['item_tank_outfit'] = "item_power_treads",
['item_dragon_knight_outfit'] = "item_soul_ring",



['item_mage_outfit'] = "item_tranquil_boots",
['item_crystal_maiden_outfit'] = "item_magic_wand",
['item_priest_outfit'] = "item_arcane_boots",


}

end
------------------------------------------------------------------------------------------------------


function Item.IsConsumableItem( sItemName )

	return tConsumableItemList[sItemName] == true

end


function Item.IsSmallItem( sItemName )

	return tSmallItemList[sItemName] ~= nil

end


function Item.IsNeutralItem( sItemName )

	return tNeutralItemLevelList[sItemName] ~= nil

end

function Item.GetNeutralItemLevel( sItemName )

	if tNeutralItemLevelList[sItemName] == nil then return 0 end

	return tNeutralItemLevelList[sItemName]

end

function Item.GetMinTeamNeutralItemLevel()

	local nMinItemLevel = 999
	for i = 1, #GetTeamPlayers( GetTeam() )
	do
		local member = GetTeamMember( i )
		if	member ~= nil
		then
			local hNeutralItem = member:GetItemInSlot( 16 )
			if hNeutralItem ~= nil
			then
				local sNeutralItemName = hNeutralItem:GetName()
				if Item.GetNeutralItemLevel( sNeutralItemName ) < nMinItemLevel
				then
					nMinItemLevel = Item.GetNeutralItemLevel( sNeutralItemName )
				end
			else
				nMinItemLevel = 0
				break
			end
		end
	end

	return nMinItemLevel

end

function Item.GetInUseNeutralItemLevel( bot )

	local hNeutralItem = bot:GetItemInSlot( 16 )
	if hNeutralItem ~= nil
	then
		local sNeutralItemName = hNeutralItem:GetName()
		return Item.GetNeutralItemLevel( sNeutralItemName )
	end

	return 0

end




function Item.IsNotSellItem( sItemName )

	return tNotSellItemList[sItemName] == true

end


function Item.IsCanNotSwitchItem( sItemName )

	return tCanNotSwitchItemList[sItemName] == true

end


function Item.IsDebugItem( sItemName )

	return tDebugItemList[sItemName] == true

end

--重点关注的物品
function Item.IsSpecifiedItem( sItemName )

	return tSpecifiedItemIndex[sItemName] == true

end


function Item.IsTopItem( sItemName )

	return tTopItemList[sItemName] == true

end


function Item.IsExistInTable( u, tUnits )

	for _, t in pairs( tUnits )
	do
		if u == t then return true end
	end

	return false

end


function Item.HasItem( bot, itemName )

	return bot:FindItemSlot( itemName ) >= 0

end

function Item.HasItemWithName( bot, iname )
	for i = 0, 8 do
		local item = bot:GetItemInSlot( i )
		if item ~= nil then
			if string.find(item:GetName(), iname) then return true end
		end
	end
	return false
end


function Item.IsItemInHero( sItemName )
	return Item.IsItemInTargetHero( sItemName, GetBot() )
end

function Item.IsItemInTargetHero( sItemName, bot )
	--7.33
	if sItemName == 'item_double_flask'
	then return Item.IsItemInHero( 'item_flask' ) end
	
	if sItemName == 'item_flask' and GetItemStockCount( 'item_flask' ) == 0
	then return true end
	

	if tDefineItemRealName[sItemName] ~= nil
	then return Item.IsItemInHero( tDefineItemRealName[sItemName] ) end

	if string.find( sItemName, 'item_double' ) ~= nil
	then return Item.GetItemCountInSolt( bot, string.gsub( sItemName, "_double", "" ), 0, 8 ) >= 2 end

	if string.find( sItemName, 'PvN_' ) ~= nil then return Item.IsItemInHero( 'item_moon_shard' ) end

	if sItemName == 'item_ultimate_scepter' and bot:HasScepter() then return true end
	
	if sItemName == 'item_moon_shard' and bot:HasModifier( "modifier_item_moon_shard_consumed" ) then return true end

	if sItemName == 'item_ultimate_scepter_2' then return ( bot:HasScepter() and bot:FindItemSlot('item_ultimate_scepter') < 0 ) end

	local nItemSolt = bot:FindItemSlot( sItemName )

	return nItemSolt >= 0 and ( nItemSolt <= 8 or Item.IsTopItem( sItemName ) )
end

--获取物品当前不重复基础构造
function Item.GetBasicItems( sItemList )

	local bot = GetBot()
	local tBasicItem = {}

	for i, v in pairs( sItemList )
	do
		local bRepeatedItem = Item.IsItemInHero( v )
		if bRepeatedItem == false
			or v == bot.sLastRepeatItem
		then
			if Item[v] ~= nil	
			then		
				for _, w in pairs( Item.GetBasicItems( Item[v] ) )
				do
					tBasicItem[#tBasicItem + 1] = w
				end
			elseif Item[v] == nil
				then
					tBasicItem[#tBasicItem + 1] = v
			end
		else
			if Item.GetItemCount( GetBot(), v ) <= 1 --能修复"两个"系列重复的问题
			then
				bot.sLastRepeatItem = v	--能修复单重重复的问题
			end
		end
	end

	return tBasicItem

end

-- function Item.ItemBasicItemsNotInHeroSlots(finalItem, bot)
	
-- end


require( GetScriptDirectory()..'/FunLib/aba_item_inventory' )(Item)

return Item
-- dota2jmz@163.com QQ:2462331592..