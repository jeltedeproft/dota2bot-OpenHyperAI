-- aba_item_components.lua
--
-- Populates the Item table with component lists for standard and custom items.
-- Extracted from aba_item.lua to keep that file a manageable size.
--
-- Usage (called automatically by aba_item.lua):
--   require(GetScriptDirectory()..'/FunLib/aba_item_components')(Item)

local function populate(Item)

------------------------------------------------------------------------------------------------------
-- Standard Dota items (component lists from game data)
------------------------------------------------------------------------------------------------------

Item['item_abyssal_blade']	= GetItemComponents( 'item_abyssal_blade' )[1]

Item['item_aether_lens']	= GetItemComponents( 'item_aether_lens' )[1]

Item['item_arcane_boots']	= GetItemComponents( 'item_arcane_boots' )[1]

Item['item_armlet']	= GetItemComponents( 'item_armlet' )[1]

Item['item_assault']	= GetItemComponents( 'item_assault' )[1]

Item['item_ancient_janggo']	= GetItemComponents( 'item_ancient_janggo' )[1]

Item['item_aeon_disk']	= GetItemComponents( 'item_aeon_disk' )[1]

Item['item_bfury']	= GetItemComponents( 'item_bfury' )[1]

Item['item_black_king_bar']	= GetItemComponents( 'item_black_king_bar' )[1]

Item['item_blade_mail']	= GetItemComponents( 'item_blade_mail' )[1]

Item['item_bloodstone']	= GetItemComponents( 'item_bloodstone' )[1]

Item['item_bloodthorn']	= GetItemComponents( 'item_bloodthorn' )[1]

Item['item_bracer']	= GetItemComponents( 'item_bracer' )[1]

Item['item_buckler']	= GetItemComponents( 'item_buckler' )[1]

Item['item_butterfly']	= GetItemComponents( 'item_butterfly' )[1]

Item['item_basher']	= GetItemComponents( 'item_basher' )[1]

Item['item_crimson_guard']	= GetItemComponents( 'item_crimson_guard' )[1]

Item['item_cyclone']	= GetItemComponents( 'item_cyclone' )[1]

Item['item_dagon']	= GetItemComponents( 'item_dagon' )[1]

Item['item_dagon_2']	= GetItemComponents( 'item_dagon_2' )[1]

Item['item_dagon_3']	= GetItemComponents( 'item_dagon_3' )[1]

Item['item_dagon_4']	= GetItemComponents( 'item_dagon_4' )[1]

Item['item_dagon_5']	= GetItemComponents( 'item_dagon_5' )[1]

Item['item_desolator']	= GetItemComponents( 'item_desolator' )[1]

Item['item_diffusal_blade']	= GetItemComponents( 'item_diffusal_blade' )[1]

Item['item_dragon_lance']	= GetItemComponents( 'item_dragon_lance' )[1]

Item['item_echo_sabre']	= GetItemComponents( 'item_echo_sabre' )[1]

Item['item_ethereal_blade']	= GetItemComponents( 'item_ethereal_blade' )[1]

Item['item_force_staff']	= GetItemComponents( 'item_force_staff' )[1]

Item['item_glimmer_cape']	= GetItemComponents( 'item_glimmer_cape' )[1]

Item['item_guardian_greaves']	= GetItemComponents( 'item_guardian_greaves' )[1]

Item['item_greater_crit']	= GetItemComponents( 'item_greater_crit' )[1]

Item['item_hand_of_midas']	= GetItemComponents( 'item_hand_of_midas' )[1]

Item['item_headdress']	= GetItemComponents( 'item_headdress' )[1]

Item['item_heart']	= GetItemComponents( 'item_heart' )[1]

Item['item_heavens_halberd']	= GetItemComponents( 'item_heavens_halberd' )[1]

Item['item_helm_of_the_dominator']	= GetItemComponents( 'item_helm_of_the_dominator' )[1]

-- Item['item_hood_of_defiance'] removed from game

Item['item_hurricane_pike']	= GetItemComponents( 'item_hurricane_pike' )[1]

Item['item_holy_locket']	= GetItemComponents( 'item_holy_locket' )[1]

Item['item_invis_sword']	= GetItemComponents( 'item_invis_sword' )[1]

Item['item_kaya']	= GetItemComponents( 'item_kaya' )[1]

Item['item_kaya_and_sange']	= GetItemComponents( 'item_kaya_and_sange' )[1]

Item['item_lotus_orb']	= GetItemComponents( 'item_lotus_orb' )[1]

Item['item_lesser_crit']	= GetItemComponents( 'item_lesser_crit' )[1]

Item['item_maelstrom']	= GetItemComponents( 'item_maelstrom' )[1]

Item['item_magic_wand']	= GetItemComponents( 'item_magic_wand' )[1]

Item['item_manta']	= GetItemComponents( 'item_manta' )[1]

Item['item_mask_of_madness']	= GetItemComponents( 'item_mask_of_madness' )[1]

-- Item['item_medallion_of_courage'] removed from game

Item['item_mekansm']	= GetItemComponents( 'item_mekansm' )[1]

Item['item_mjollnir']	= GetItemComponents( 'item_mjollnir' )[1]

Item['item_monkey_king_bar']	= GetItemComponents( 'item_monkey_king_bar' )[1]

Item['item_moon_shard']	= GetItemComponents( 'item_moon_shard' )[1]

Item['item_meteor_hammer']	= GetItemComponents( 'item_meteor_hammer' )[1]

Item['item_necronomicon']	= GetItemComponents( 'item_necronomicon' )[1]

Item['item_necronomicon_2']	= GetItemComponents( 'item_necronomicon_2' )[1]

Item['item_necronomicon_3']	= GetItemComponents( 'item_necronomicon_3' )[1]

Item['item_null_talisman']	= GetItemComponents( 'item_null_talisman' )[1]

Item['item_nullifier']	= GetItemComponents( 'item_nullifier' )[1]

Item['item_oblivion_staff']	= GetItemComponents( 'item_oblivion_staff' )[1]

Item['item_octarine_core']	= GetItemComponents( 'item_octarine_core' )[1]

Item['item_orchid']	= GetItemComponents( 'item_orchid' )[1]

Item['item_pers']	= GetItemComponents( 'item_pers' )[1]

Item['item_phase_boots']	= { 'item_blades_of_attack', 'item_boots', 'item_chainmail' }

Item['item_pipe']	= GetItemComponents( 'item_pipe' )[1]

Item['item_power_treads_agi']	= { 'item_boots', 'item_boots_of_elves', 'item_gloves' }

Item['item_power_treads_int']	= { 'item_boots', 'item_robe', 'item_gloves' }

Item['item_power_treads_str']	= { 'item_boots', 'item_belt_of_strength', 'item_gloves' }

Item['item_power_treads']	= { 'item_boots', 'item_belt_of_strength', 'item_gloves' }

Item['item_radiance']	= GetItemComponents( 'item_radiance' )[1]

Item['item_rapier']	= GetItemComponents( 'item_rapier' )[1]

Item['item_refresher']	= GetItemComponents( 'item_refresher' )[1]

Item['item_ring_of_basilius']	= GetItemComponents( 'item_ring_of_basilius' )[1]

Item['item_rod_of_atos']	= GetItemComponents( 'item_rod_of_atos' )[1]

Item['item_sange']	= GetItemComponents( 'item_sange' )[1]

Item['item_sange_and_yasha']	= GetItemComponents( 'item_sange_and_yasha' )[1]

Item['item_satanic']	= GetItemComponents( 'item_satanic' )[1]

Item['item_sheepstick']	= GetItemComponents( 'item_sheepstick' )[1]

Item['item_sphere']	= GetItemComponents( 'item_sphere' )[1]

Item['item_shivas_guard']	= GetItemComponents( 'item_shivas_guard' )[1]

Item['item_silver_edge']	= GetItemComponents( 'item_silver_edge' )[1]

Item['item_solar_crest']	= GetItemComponents( 'item_solar_crest' )[1]

Item['item_soul_booster']	= GetItemComponents( 'item_soul_booster' )[1]

Item['item_soul_ring']	= GetItemComponents( 'item_soul_ring' )[1]

Item['item_skadi']	= GetItemComponents( 'item_skadi' )[1]

Item['item_spirit_vessel']	= GetItemComponents( 'item_spirit_vessel' )[1]

Item['item_tranquil_boots']	= GetItemComponents( 'item_tranquil_boots' )[1]

Item['item_travel_boots']	= GetItemComponents( 'item_travel_boots' )[1]

Item['item_travel_boots_2']	= GetItemComponents( 'item_travel_boots_2' )[1]

Item['item_urn_of_shadows']	= GetItemComponents( 'item_urn_of_shadows' )[1]

Item['item_ultimate_scepter']	= { 'item_point_booster', 'item_ogre_axe', 'item_blade_of_alacrity', 'item_staff_of_wizardry' }

Item['item_ultimate_scepter_2']	= GetItemComponents( 'item_ultimate_scepter_2' )[1]

Item['item_vanguard']	= GetItemComponents( 'item_vanguard' )[1]

Item['item_veil_of_discord']	= GetItemComponents( 'item_veil_of_discord' )[1]

Item['item_vladmir']	= GetItemComponents( 'item_vladmir' )[1]

Item['item_wraith_band']	= GetItemComponents( 'item_wraith_band' )[1]

Item['item_yasha']	= { 'item_boots_of_elves', 'item_blade_of_alacrity', 'item_recipe_yasha' }

Item['item_yasha_and_kaya']	= GetItemComponents( 'item_yasha_and_kaya' )[1]

Item['item_falcon_blade']	= GetItemComponents( 'item_falcon_blade' )[1]

Item['item_orb_of_corrosion']	= GetItemComponents( 'item_orb_of_corrosion' )[1]

Item['item_witch_blade']	= GetItemComponents( 'item_witch_blade' )[1]

Item['item_gungir']	= GetItemComponents( 'item_gungir' )[1]

Item['item_mage_slayer']	= GetItemComponents( 'item_mage_slayer' )[1]

-- Item['item_eternal_shroud'] removed from game in 7.41

Item['item_helm_of_the_overlord']	= GetItemComponents( 'item_helm_of_the_overlord' )[1]

Item['item_overwhelming_blink']	= GetItemComponents( 'item_overwhelming_blink' )[1]

Item['item_swift_blink']	= GetItemComponents( 'item_swift_blink' )[1]

Item['item_arcane_blink']	= GetItemComponents( 'item_arcane_blink' )[1]

Item['item_wind_waker']	= GetItemComponents( 'item_wind_waker' )[1]

-- 7.31
Item['item_revenants_brooch']	= GetItemComponents( 'item_revenants_brooch' )[1]

Item['item_boots_of_bearing']	= GetItemComponents( 'item_boots_of_bearing' )[1]

-- Item['item_wraith_pact'] removed from game

-- 7.33
Item['item_pavise']       = GetItemComponents( 'item_pavise' )[1]
Item['item_phylactery']   = GetItemComponents( 'item_phylactery' )[1]
Item['item_harpoon']      = GetItemComponents( 'item_harpoon' )[1]
Item['item_disperser']    = GetItemComponents( 'item_disperser' )[1]
Item['item_blood_grenade'] = GetItemComponents( 'item_blood_grenade' )[1]

-- 7.35
Item['item_angels_demise'] = GetItemComponents( 'item_angels_demise' )[1]
Item['item_devastator']    = GetItemComponents( 'item_devastator' )[1]

-- 7.41
Item['item_essence_distiller']  = GetItemComponents( 'item_essence_distiller' )[1]
Item['item_specialists_array']  = GetItemComponents( 'item_specialists_array' )[1]
Item['item_hydras_breath']      = GetItemComponents( 'item_hydras_breath' )[1]
Item['item_consecrated_wraps']  = GetItemComponents( 'item_consecrated_wraps' )[1]
Item['item_crellas_crozier']    = GetItemComponents( 'item_crellas_crozier' )[1]

-- Custom new item slots
Item['item_new_1']	= GetItemComponents( 'item_new_1' )[1]
Item['item_new_2']	= GetItemComponents( 'item_new_2' )[1]
Item['item_new_3']	= GetItemComponents( 'item_new_3' )[1]
Item['item_new_4']	= GetItemComponents( 'item_new_4' )[1]
Item['item_new_5']	= GetItemComponents( 'item_new_5' )[1]
Item['item_new_6']	= GetItemComponents( 'item_new_6' )[1]

------------------------------------------------------------------------------------------------------
-- Custom items: doubles, broken variants, outfits, PvN builds
------------------------------------------------------------------------------------------------------

Item['item_double_branches']		= { 'item_branches', 'item_branches' }
Item['item_double_tango']			= { 'item_tango', 'item_tango' }
Item['item_double_clarity']			= { 'item_clarity', 'item_clarity' }
Item['item_double_flask']			= { 'item_flask', 'item_flask' }
Item['item_double_enchanted_mango']	= { 'item_enchanted_mango', 'item_enchanted_mango' }
Item['item_double_circlet']			= { 'item_circlet', 'item_circlet' }
Item['item_double_slippers']		= { 'item_slippers', 'item_slippers' }
Item['item_double_mantle']			= { 'item_mantle', 'item_mantle' }
Item['item_double_gauntlets']		= { 'item_gauntlets', 'item_gauntlets' }
Item['item_double_wraith_band']		= { 'item_wraith_band', 'item_wraith_band' }
Item['item_double_null_talisman']	= { 'item_null_talisman', 'item_null_talisman' }
Item['item_double_bracer']			= { 'item_bracer', 'item_bracer' }
Item['item_double_crown']			= { 'item_crown', 'item_crown' }

Item['item_broken_hurricane_pike']	= { 'item_force_staff', 'item_recipe_hurricane_pike' }
Item['item_broken_silver_edge']		= { 'item_blitz_knuckles', 'item_broadsword', 'item_recipe_silver_edge' }
Item['item_broken_bfury']			= { 'item_ring_of_health', 'item_void_stone', 'item_broadsword', 'item_claymore' }
Item['item_broken_satanic']			= { 'item_reaver', 'item_claymore' }
Item['item_broken_soul_ring']		= { 'item_ring_of_protection', 'item_recipe_soul_ring' }

Item['item_four_branches']	= { 'item_branches', 'item_branches', 'item_branches', 'item_branches' }
Item['item_six_branches']	= { 'item_branches', 'item_branches', 'item_branches', 'item_branches', 'item_branches', 'item_branches' }

-- Starter outfits
Item['item_mid_outfit']					= { 'item_tango', 'item_faerie_fire', 'item_double_branches', 'item_wraith_band', 'item_flask', 'item_magic_stick', 'item_recipe_magic_wand', 'item_power_treads_agi' }
Item['item_medusa_outfit']				= { 'item_null_talisman', 'item_double_branches', 'item_null_talisman', 'item_null_talisman', 'item_power_treads_int', 'item_magic_stick', 'item_recipe_magic_wand' }
Item['item_templar_assassin_outfit']	= { 'item_tango', 'item_faerie_fire', 'item_double_branches', 'item_wraith_band', 'item_flask', 'item_magic_stick', 'item_recipe_magic_wand', 'item_power_treads_agi', 'item_blight_stone' }

Item['item_ranged_carry_outfit']		= { 'item_tango', 'item_flask', 'item_double_branches', 'item_slippers', 'item_circlet', 'item_magic_stick', 'item_recipe_wraith_band', 'item_power_treads_agi', 'item_recipe_magic_wand', 'item_infused_raindrop' }
Item['item_melee_carry_outfit']			= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_slippers', 'item_recipe_wraith_band', 'item_recipe_magic_wand', 'item_power_treads_agi' }
Item['item_phantom_assassin_outfit']	= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_slippers', 'item_recipe_wraith_band', 'item_recipe_magic_wand', 'item_power_treads_agi', 'item_blight_stone' }
Item['item_juggernaut_outfit']			= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_slippers', 'item_recipe_wraith_band', 'item_recipe_magic_wand', 'item_phase_boots', 'item_wraith_band' }
Item['item_huskar_outfit']				= { 'item_tango', 'item_flask', 'item_double_branches', 'item_gauntlets', 'item_circlet', 'item_magic_stick', 'item_recipe_bracer', 'item_boots', 'item_bracer', 'item_recipe_magic_wand', 'item_blades_of_attack', 'item_chainmail' }
Item['item_sven_outfit']				= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_gauntlets', 'item_recipe_bracer', 'item_recipe_magic_wand', 'item_phase_boots' }
Item['item_bristleback_outfit']			= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_gauntlets', 'item_recipe_bracer', 'item_recipe_magic_wand', 'item_power_treads_str' }

Item['item_tank_outfit']		= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_gauntlets', 'item_recipe_bracer', 'item_recipe_magic_wand', 'item_power_treads_str' }
Item['item_dragon_knight_outfit']	= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_gauntlets', 'item_magic_stick', 'item_recipe_magic_wand', 'item_gauntlets', 'item_power_treads_str', 'item_broken_soul_ring' }

Item['item_priest_outfit']		= { 'item_tango', 'item_tango', 'item_branches', 'item_magic_stick', 'item_branches', 'item_arcane_boots', 'item_recipe_magic_wand', 'item_flask', 'item_urn_of_shadows' }

Item['item_mage_outfit']		= { 'item_tango', 'item_tango', 'item_double_branches', 'item_circlet', 'item_mantle', 'item_magic_stick', 'item_recipe_null_talisman', 'item_tranquil_boots', 'item_recipe_magic_wand', 'item_flask' }
Item['item_crystal_maiden_outfit']	= { 'item_tango', 'item_double_branches', 'item_circlet', 'item_mantle', 'item_magic_stick', 'item_recipe_null_talisman', 'item_arcane_boots', 'item_recipe_magic_wand', 'item_flask' }

-- PvN (Player-vs-Neutral) item builds
Item['PvN_priest']		= { 'item_tango', 'item_flask', 'item_bracer', 'item_power_treads_int', 'item_bracer', 'item_ghost', 'item_glimmer_cape', 'item_aeon_disk', 'item_cyclone', 'item_sphere', 'item_sheepstick', 'item_moon_shard' }
Item['PvN_mage']		= { 'item_tango', 'item_flask', 'item_bracer', 'item_power_treads_int', 'item_bracer', 'item_ghost', 'item_glimmer_cape', 'item_aeon_disk', 'item_lotus_orb', 'item_force_staff', 'item_sheepstick', 'item_moon_shard' }
Item['PvN_melee_carry']	= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_wraith_band', 'item_wraith_band', 'item_power_treads_agi', 'item_blade_mail', 'item_heavens_halberd', 'item_diffusal_blade', 'item_travel_boots', 'item_abyssal_blade', 'item_moon_shard' }
Item['PvN_str_carry']	= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_bracer', 'item_bracer', 'item_power_treads_str', 'item_blade_mail', 'item_heavens_halberd', 'item_travel_boots', 'item_abyssal_blade', 'item_moon_shard' }
Item['PvN_ranged_carry']= { 'item_tango', 'item_flask', 'item_wraith_band', 'item_wraith_band', 'item_power_treads_agi', 'item_wraith_band', 'item_dragon_lance', 'item_ghost', 'item_heavens_halberd', 'item_travel_boots', 'item_broken_hurricane_pike', 'item_bloodthorn', 'item_moon_shard', 'item_travel_boots_2' }
Item['PvN_tank']		= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_bracer', 'item_bracer', 'item_power_treads_str', 'item_blade_mail', 'item_crimson_guard', 'item_heavens_halberd', 'item_travel_boots', 'item_assault', 'item_moon_shard', 'item_travel_boots_2' }
Item['PvN_mid']			= { 'item_tango', 'item_flask', 'item_wraith_band', 'item_wraith_band', 'item_power_treads_agi', 'item_dragon_lance', 'item_ghost', 'item_heavens_halberd', 'item_travel_boots', 'item_broken_hurricane_pike', 'item_bloodthorn', 'item_moon_shard', 'item_travel_boots_2' }
Item['PvN_antimage']	= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_wraith_band', 'item_wraith_band', 'item_power_treads_agi', 'item_blade_mail', 'item_broken_bfury', 'item_manta', 'item_heavens_halberd', 'item_travel_boots', 'item_abyssal_blade', 'item_skadi', 'item_moon_shard', 'item_travel_boots_2' }
Item['PvN_huskar']		= { 'item_tango', 'item_flask', 'item_bracer', 'item_bracer', 'item_bracer', 'item_power_treads_agi', 'item_dragon_lance', 'item_blade_mail', 'item_heavens_halberd', 'item_travel_boots', 'item_broken_hurricane_pike', 'item_heart', 'item_moon_shard', 'item_travel_boots_2' }
Item['PvN_clinkz']		= { 'item_tango', 'item_flask', 'item_wraith_band', 'item_wraith_band', 'item_power_treads_agi', 'item_dragon_lance', 'item_blade_mail', 'item_heavens_halberd', 'item_travel_boots', 'item_solar_crest', 'item_broken_hurricane_pike', 'item_bloodthorn', 'item_moon_shard', 'item_travel_boots_2' }
Item['PvN_BH']			= { 'item_tango', 'item_flask', 'item_wraith_band', 'item_wraith_band', 'item_power_treads_agi', 'item_ghost', 'item_heavens_halberd', 'item_travel_boots', 'item_solar_crest', 'item_abyssal_blade', 'item_bloodthorn', 'item_moon_shard', 'item_travel_boots_2' }
Item['PvN_TA']			= { 'item_tango', 'item_flask', 'item_wraith_band', 'item_wraith_band', 'item_power_treads_agi', 'item_dragon_lance', 'item_ghost', 'item_heavens_halberd', 'item_travel_boots', 'item_desolator', 'item_broken_hurricane_pike', 'item_bloodthorn', 'item_moon_shard', 'item_travel_boots_2' }
Item['PvN_PA']			= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_wraith_band', 'item_wraith_band', 'item_power_treads_agi', 'item_blade_mail', 'item_heavens_halberd', 'item_travel_boots', 'item_desolator', 'item_abyssal_blade', 'item_nullifier', 'item_moon_shard', 'item_travel_boots_2' }
Item['PvN_PL']			= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_wraith_band', 'item_wraith_band', 'item_power_treads_agi', 'item_diffusal_blade', 'item_blade_mail', 'item_manta', 'item_heavens_halberd', 'item_travel_boots', 'item_abyssal_blade', 'item_moon_shard', 'item_travel_boots_2' }
Item['PvN_OM']			= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_bracer', 'item_bracer', 'item_power_treads_int', 'item_ghost', 'item_hand_of_midas', 'item_heavens_halberd', 'item_travel_boots', 'item_sheepstick', 'item_moon_shard', 'item_travel_boots_2' }

end

return populate
