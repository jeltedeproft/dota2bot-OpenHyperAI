-- neutral_item_pool.lua
-- Single source of truth for neutral items used by both game modes:
--   Buff mode   → bots/Buff/NeutralItems.lua        (random distribution)
--   FretBots    → bots/FretBots/SettingsNeutralItemTable.lua (role-weighted)
--
-- DO NOT edit the item lists in NeutralItems.lua or SettingsNeutralItemTable.lua.
-- Edit here, then both modes pick up the change automatically.
--
-- Schema per item:
--   name     : string  -- internal name (item_xxx)
--   tier     : number  -- 1–5
--   ranged   : number  -- weight for ranged heroes  (used by FretBots)
--   melee    : number  -- weight for melee heroes   (used by FretBots)
--   roles    : table   -- desire weights {pos1, pos2, pos3, pos4, pos5}  (used by FretBots)
--   realName : string  -- display name for debugging / logging
--   buff     : bool    -- false = exclude from Buff-mode random pool
--                           (items with complex actives the random assigner can't handle)
--
-- Patch history is preserved via comments so future updates have full context.

local items = {

    -- -------------------------------------------------------------------------
    -- TIER 1
    -- -------------------------------------------------------------------------
    -- {name="item_arcane_ring",         tier=1, ranged=1, melee=1, roles={1,1,1,2,2}, realName="Arcane Ring"},             -- removed in 7.41
    -- {name="item_broom_handle",        tier=1, ranged=0, melee=3, roles={2,2,1,0,0}, realName="Broom Handle"},
    {name="item_duelist_gloves",      tier=1, ranged=0, melee=1, roles={1,1,1,1,1}, realName="Duelist Gloves"},
    -- {name="item_faded_broach",        tier=1, ranged=1, melee=1, roles={5,5,5,5,5}, realName="Faded Broach"},
    -- {name="item_foragers_kit",        tier=1, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Forager's Kit", buff=false},  -- active: plant tree (complex)
    -- {name="item_mysterious_hat",      tier=1, ranged=1, melee=1, roles={1,4,1,1,1}, realName="Fairy's Trinket"},
    -- {name="item_lance_of_pursuit",    tier=1, ranged=1, melee=2, roles={2,2,1,1,1}, realName="Lance of Pursuit"},
    {name="item_occult_bracelet",     tier=1, ranged=1, melee=1, roles={1,1,3,2,2}, realName="Occult Bracelet"},
    -- {name="item_orb_of_destruction",  tier=1, ranged=1, melee=1, roles={4,1,1,0,0}, realName="Orb of Destruction"},        -- removed in 7.41
    {name="item_polliwog_charm",      tier=1, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Polliwog Charm"},
    -- {name="item_rippers_lash",        tier=1, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Ripper's Lash"},             -- removed in 7.41
    -- {name="item_royal_jelly",         tier=1, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Royal Jelly"},
    -- {name="item_safety_bubble",       tier=1, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Safety Bubble"},
    -- {name="item_seeds_of_serenity",   tier=1, ranged=1, melee=1, roles={0,0,0,1,1}, realName="Seeds of Serenity"},         -- moved to T2 in 7.41
    -- {name="item_sisters_shroud",      tier=1, ranged=1, melee=1, roles={1,1,1,5,5}, realName="Sister's Shroud"},
    -- {name="item_spark_of_courage",    tier=1, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Spark of Courage"},          -- removed in 7.41
    -- {name="item_trusty_shovel",       tier=1, ranged=1, melee=1, roles={0,0,0,0,0}, realName="Trusty Shovel"},             -- removed in 7.41
    -- {name="item_unstable_wand",       tier=1, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Pig Pole"},                  -- removed in 7.41
    {name="item_chipped_vest",        tier=1, ranged=0, melee=1, roles={2,2,4,2,2}, realName="Chipped Vest"},
    {name="item_possessed_mask",      tier=1, ranged=1, melee=1, roles={3,3,2,1,1}, realName="Possessed Mask"},
    {name="item_dormant_curio",       tier=1, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Dormant Curio"},
    {name="item_kobold_cup",          tier=1, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Kobold Cup"},
    {name="item_ash_legion_shield",   tier=1, ranged=0, melee=1, roles={1,1,2,3,3}, realName="Ash Legion Shield"},
    {name="item_weighted_dice",       tier=1, ranged=1, melee=1, roles={3,3,1,1,1}, realName="Weighted Dice"},
    {name="item_dagger_of_ristul",    tier=1, ranged=1, melee=1, roles={3,3,1,0,0}, realName="Dagger of Ristul"},
    {name="item_stonefeather_satchel",tier=1, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Stonefeather Satchel"},

    -- -------------------------------------------------------------------------
    -- TIER 2
    -- -------------------------------------------------------------------------
    -- {name="item_bullwhip",            tier=2, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Bullwhip"},
    -- {name="item_clumsy_net",          tier=2, ranged=1, melee=1, roles={1,1,2,3,3}, realName="Clumsy Net"},
    -- {name="item_dagger_of_ristul",    tier=2, ranged=1, melee=1, roles={2,2,1,1,1}, realName="Dagger of Ristul"},          -- moved to T1 in 7.41
    -- {name="item_dragon_scale",        tier=2, ranged=1, melee=1, roles={1,1,3,1,1}, realName="Dragon Scale"},
    -- {name="item_eye_of_the_vizier",   tier=2, ranged=1, melee=1, roles={1,1,1,4,4}, realName="Eye of the Vizier"},
    -- {name="item_gossamer_cape",       tier=2, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Gossamer Cape"},             -- removed in 7.41
    -- {name="item_grove_bow",           tier=2, ranged=5, melee=0, roles={2,2,1,-5,-5},realName="Grove Bow"},
    -- {name="item_iron_talon",          tier=2, ranged=1, melee=1, roles={1,1,1,0,0}, realName="Iron Talon"},               -- removed in 7.41
    -- {name="item_light_collector",     tier=2, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Light Collector"},
    -- {name="item_mana_draught",        tier=2, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Mana Draught"},             -- moved from T1 in 7.41 (entry below is correct T2)
    -- {name="item_misericorde",         tier=2, ranged=1, melee=1, roles={4,2,1,0,0}, realName="Brigand's Blade"},          -- removed in 7.41
    -- {name="item_pupils_gift",         tier=2, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Pupil's Gift"},
    -- {name="item_specialists_array",   tier=2, ranged=2, melee=0, roles={2,2,1,1,1}, realName="Specialist's Array"},
    -- {name="item_vampire_fangs",       tier=2, ranged=1, melee=1, roles={2,2,2,0,0}, realName="Vampire Fangs"},
    -- {name="item_whisper_of_the_dread",tier=2, ranged=1, melee=1, roles={1,2,1,4,4}, realName="Whisper of the Dread"},
    {name="item_searing_signet",      tier=2, ranged=1, melee=1, roles={2,2,1,2,2}, realName="Searing Signet"},
    {name="item_essence_ring",        tier=2, ranged=1, melee=1, roles={3,3,3,2,2}, realName="Essence Ring"},
    {name="item_pogo_stick",          tier=2, ranged=1, melee=1, roles={3,3,3,3,3}, realName="Tumbler's Toy"},
    {name="item_mana_draught",        tier=2, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Mana Draught"},
    {name="item_poor_mans_shield",    tier=2, ranged=1, melee=3, roles={2,2,3,1,1}, realName="Poor Man's Shield"},
    {name="item_defiant_shell",       tier=2, ranged=1, melee=2, roles={2,2,6,2,2}, realName="Defiant Shell"},
    {name="item_crippling_crossbow",  tier=2, ranged=1, melee=1, roles={1,1,3,1,1}, realName="Crippling Crossbow"},
    {name="item_medallion_of_courage",tier=2, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Medallion of Courage"},
    {name="item_seeds_of_serenity",   tier=2, ranged=1, melee=1, roles={0,0,0,1,1}, realName="Seeds of Serenity"},

    -- -------------------------------------------------------------------------
    -- TIER 3
    -- -------------------------------------------------------------------------
    -- {name="item_craggy_coat",         tier=3, ranged=1, melee=1, roles={0,0,4,1,1}, realName="Craggy Coat"},
    -- {name="item_dandelion_amulet",    tier=3, ranged=1, melee=2, roles={2,2,6,2,2}, realName="Dandelion Amulet"},          -- moved to T4 in 7.41
    -- {name="item_defiant_shell",       tier=3, ranged=1, melee=2, roles={2,2,6,2,2}, realName="Defiant Shell"},             -- moved to T2 in 7.41
    -- {name="item_doubloon",            tier=3, ranged=0, melee=0, roles={0,0,0,0,0}, realName="Doubloon"},
    -- {name="item_elven_tunic",         tier=3, ranged=1, melee=1, roles={5,5,5,2,2}, realName="Elven Tunic"},
    -- {name="item_enchanted_quiver",    tier=3, ranged=4, melee=0, roles={1,1,1,1,1}, realName="Enchanted Quiver"},
    -- {name="item_gale_guard",          tier=3, ranged=1, melee=1, roles={1,1,4,1,1}, realName="Gale Guard"},               -- removed in 7.41
    -- {name="item_nemesis_curse",       tier=3, ranged=1, melee=1, roles={2,2,0,0,0}, realName="Nemesis Curse"},            -- removed in 7.41
    -- {name="item_ninja_gear",          tier=3, ranged=1, melee=1, roles={2,1,1,0,0}, realName="Ninja Gear"},               -- removed in 7.41
    -- {name="item_paladin_sword",       tier=3, ranged=1, melee=1, roles={4,1,1,0,0}, realName="Paladin Sword"},
    {name="item_psychic_headband",    tier=3, ranged=3, melee=1, roles={1,1,1,6,6}, realName="Psychic Headband", buff=false}, -- active: push (complex, skip in Buff random pool)
    -- {name="item_vambrace",            tier=3, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Vambrace"},
    -- {name="item_vindicators_axe",     tier=3, ranged=1, melee=1, roles={1,1,4,1,1}, realName="Vindicator's Axe"},
    -- {name="item_whisper_of_the_dread",tier=3, ranged=1, melee=1, roles={1,2,1,4,4}, realName="Whisper of the Dread"},     -- removed in 7.41
    {name="item_cloak_of_flames",     tier=3, ranged=1, melee=2, roles={2,2,6,2,2}, realName="Cloak of Flames"},
    {name="item_serrated_shiv",       tier=3, ranged=1, melee=1, roles={1,1,4,1,1}, realName="Serrated Shiv"},
    {name="item_gunpowder_gauntlets", tier=3, ranged=1, melee=1, roles={1,1,4,1,1}, realName="Gunpowder Gauntlets"},
    {name="item_jidi_pollen_bag",     tier=3, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Jidi Pollen Bag"},
    {name="item_unrelenting_eye",     tier=3, ranged=1, melee=1, roles={2,2,2,2,2}, realName="Unrelenting Eye"},
    {name="item_spellslinger",        tier=3, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Spellslinger"},
    {name="item_stormcrafter",        tier=3, ranged=1, melee=1, roles={1,1,3,3,3}, realName="Stormcrafter"},
    {name="item_partisans_brand",     tier=3, ranged=1, melee=1, roles={3,3,1,0,0}, realName="Partisan's Brand"},

    -- -------------------------------------------------------------------------
    -- TIER 4
    -- -------------------------------------------------------------------------
    -- {name="item_ancient_guardian",    tier=4, ranged=1, melee=1, roles={3,1,1,0,0}, realName="Ancient Guardian"},
    -- {name="item_ascetic_cap",         tier=4, ranged=1, melee=1, roles={1,1,6,1,1}, realName="Ascetic's Cap"},
    -- {name="item_avianas_feather",     tier=4, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Aviana's Feather"},
    -- {name="item_ceremonial_robe",     tier=4, ranged=1, melee=1, roles={1,1,1,5,5}, realName="Ceremonial Robe"},          -- removed in 7.41
    -- {name="item_crippling_crossbow",  tier=4, ranged=1, melee=1, roles={1,1,3,1,1}, realName="Crippling Crossbow"},       -- moved to T2 in 7.41
    -- {name="item_dezun_bloodrite",     tier=4, ranged=1, melee=1, roles={1,2,3,4,4}, realName="Dezun Bloodrite"},          -- moved to T5 in 7.41
    -- {name="item_havoc_hammer",        tier=4, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Havoc Hammer"},
    -- {name="item_magnifying_monocle",  tier=4, ranged=1, melee=1, roles={2,2,1,3,3}, realName="Magnifying Monocle"},      -- removed in 7.41
    -- {name="item_martyrs_plate",       tier=4, ranged=1, melee=1, roles={1,1,5,0,0}, realName="Martyr's Plate"},
    -- {name="item_mind_breaker",        tier=4, ranged=1, melee=1, roles={4,1,1,0,0}, realName="Mind Breaker"},            -- removed in 7.41
    -- {name="item_ogre_seal_totem",     tier=4, ranged=1, melee=1, roles={1,1,3,1,1}, realName="Ogre Seal Totem"},         -- removed in 7.41
    -- {name="item_outworld_staff",      tier=4, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Outworld Staff"},
    -- {name="item_pyrrhic_cloak",       tier=4, ranged=1, melee=1, roles={1,1,4,4,4}, realName="Pyrrhic Cloak"},           -- removed in 7.41
    -- {name="item_spy_gadget",          tier=4, ranged=4, melee=0, roles={0,0,0,3,3}, realName="Telescope"},
    -- {name="item_stormcrafter",        tier=4, ranged=1, melee=1, roles={1,1,3,3,3}, realName="Stormcrafter"},            -- moved to T3 in 7.41
    -- {name="item_timeless_relic",      tier=4, ranged=1, melee=1, roles={1,4,1,3,3}, realName="Timeless Relic"},
    -- {name="item_trickster_cloak",     tier=4, ranged=1, melee=1, roles={1,1,1,4,4}, realName="Trickster Cloak"},
    {name="item_rattlecage",          tier=4, ranged=1, melee=1, roles={0,0,6,1,1}, realName="Rattlecage"},
    {name="item_giant_maul",          tier=4, ranged=1, melee=1, roles={5,5,1,0,0}, realName="Giant's Maul"},
    {name="item_flayers_bota",        tier=4, ranged=1, melee=1, roles={5,5,1,0,0}, realName="Flayer's Bota"},
    {name="item_idol_of_screeauk",    tier=4, ranged=1, melee=1, roles={2,2,3,4,4}, realName="Idol of Scree'Auk"},
    {name="item_metamorphic_mandible",tier=4, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Metamorphic Mandible"},
    {name="item_dandelion_amulet",    tier=4, ranged=1, melee=2, roles={2,2,6,2,2}, realName="Dandelion Amulet"},
    {name="item_enchanters_bauble",   tier=4, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Enchanter's Bauble"},
    {name="item_prophets_pendulum",   tier=4, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Prophet's Pendulum"},
    {name="item_conjurers_catalyst",  tier=4, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Conjurer's Catalyst"},

    -- -------------------------------------------------------------------------
    -- TIER 5
    -- -------------------------------------------------------------------------
    -- {name="item_apex",               tier=5, ranged=1, melee=1, roles={1,1,1,0,0}, realName="Apex"},
    -- {name="item_book_of_shadows",    tier=5, ranged=1, melee=1, roles={1,1,1,6,6}, realName="Book of Shadows"},
    -- {name="item_force_boots",        tier=5, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Force Boots"},
    -- {name="item_force_field",        tier=5, ranged=1, melee=1, roles={2,5,1,7,7}, realName="Arcanist's Armor"},
    -- {name="item_giants_ring",        tier=5, ranged=1, melee=1, roles={3,3,6,1,1}, realName="Giant's Ring"},
    -- {name="item_mirror_shield",      tier=5, ranged=1, melee=1, roles={2,2,4,0,0}, realName="Mirror Shield"},
    -- {name="item_panic_button",       tier=5, ranged=1, melee=1, roles={1,1,3,1,1}, realName="Magic Lamp"},              -- removed in 7.41
    -- {name="item_pirate_hat",         tier=5, ranged=1, melee=1, roles={4,3,1,0,0}, realName="Pirate Hat"},              -- removed in 7.41
    -- {name="item_seer_stone",         tier=5, ranged=1, melee=1, roles={1,1,2,5,5}, realName="Seer Stone"},
    -- {name="item_unrelenting_eye",    tier=5, ranged=1, melee=1, roles={2,2,2,2,2}, realName="Unrelenting Eye"},         -- moved to T3 in 7.41
    -- {name="item_unwavering_condition",tier=5,ranged=1, melee=1, roles={1,1,1,1,1}, realName="Unwavering Condition"},
    {name="item_demonicon",           tier=5, ranged=1, melee=1, roles={1,1,1,5,6}, realName="Book of the Dead"},
    {name="item_desolator_2",         tier=5, ranged=1, melee=1, roles={5,1,0,0,0}, realName="Stygian Desolator"},
    {name="item_fallen_sky",          tier=5, ranged=1, melee=1, roles={1,1,5,0,0}, realName="Fallen Sky"},
    {name="item_minotaur_horn",       tier=5, ranged=1, melee=1, roles={1,1,1,1,1}, realName="Minotaur Horn"},
    {name="item_spider_legs",         tier=5, ranged=1, melee=1, roles={2,2,2,2,2}, realName="Spider Legs"},
    {name="item_divine_regalia",      tier=5, ranged=1, melee=1, roles={4,4,1,1,1}, realName="Divine Regalia"},
    {name="item_riftshadow_prism",    tier=5, ranged=1, melee=2, roles={4,4,1,1,1}, realName="Riftshadow Prism"},
    {name="item_dezun_bloodrite",     tier=5, ranged=1, melee=1, roles={1,2,3,4,4}, realName="Dezun Bloodrite"},
    {name="item_harmonizer",          tier=5, ranged=1, melee=1, roles={1,1,1,3,3}, realName="Harmonizer"},
    {name="item_heavy_blade",         tier=5, ranged=1, melee=1, roles={3,6,1,1,1}, realName="Heavy Blade"},
}

-- Enhancements are the same across both game modes.
local enhancements = {
    -- Tier 1
    {name="item_enhancement_mystical",  tier=1, roles={1,1,1,1,1}, realName="Mystical Enhancement"},
    {name="item_enhancement_brawny",    tier=1, roles={1,1,3,2,2}, realName="Brawny Enhancement"},
    {name="item_enhancement_alert",     tier=1, roles={1,2,1,1,1}, realName="Alert Enhancement"},
    {name="item_enhancement_tough",     tier=1, roles={1,1,2,2,1}, realName="Tough Enhancement"},
    {name="item_enhancement_quickened", tier=1, roles={1,1,1,2,1}, realName="Quickened Enhancement"},
    {name="item_enhancement_vital",     tier=1, roles={1,1,1,1,1}, realName="Vital Enhancement"},

    -- Tier 2
    {name="item_enhancement_mystical",  tier=2, roles={1,1,1,1,1}, realName="Mystical Enhancement"},
    {name="item_enhancement_brawny",    tier=2, roles={1,1,3,2,2}, realName="Brawny Enhancement"},
    {name="item_enhancement_alert",     tier=2, roles={1,2,1,1,1}, realName="Alert Enhancement"},
    {name="item_enhancement_tough",     tier=2, roles={1,1,2,2,1}, realName="Tough Enhancement"},
    {name="item_enhancement_quickened", tier=2, roles={1,1,1,2,1}, realName="Quickened Enhancement"},
    {name="item_enhancement_keen_eyed", tier=2, roles={1,1,1,1,2}, realName="Keen Eyed Enhancement"},
    {name="item_enhancement_vast",      tier=2, roles={1,1,1,1,1}, realName="Vast Enhancement"},
    {name="item_enhancement_greedy",    tier=2, roles={1,1,1,2,2}, realName="Greedy Enhancement"},
    {name="item_enhancement_vampiric",  tier=2, roles={1,1,1,1,1}, realName="Vampiric Enhancement"},
    {name="item_enhancement_nimble",    tier=2, roles={1,1,1,1,1}, realName="Nimble Enhancement"},
    {name="item_enhancement_crude",     tier=2, roles={1,1,1,1,1}, realName="Crude Enhancement"},
    {name="item_enhancement_titanic",   tier=2, roles={1,1,1,1,1}, realName="Titanic Enhancement"},

    -- Tier 3
    {name="item_enhancement_mystical",  tier=3, roles={1,1,1,1,1}, realName="Mystical Enhancement"},
    {name="item_enhancement_brawny",    tier=3, roles={1,1,3,2,2}, realName="Brawny Enhancement"},
    {name="item_enhancement_alert",     tier=3, roles={1,2,1,1,1}, realName="Alert Enhancement"},
    {name="item_enhancement_tough",     tier=3, roles={1,1,2,2,1}, realName="Tough Enhancement"},
    {name="item_enhancement_quickened", tier=3, roles={1,1,1,2,1}, realName="Quickened Enhancement"},
    {name="item_enhancement_keen_eyed", tier=3, roles={1,1,1,1,2}, realName="Keen Eyed Enhancement"},
    {name="item_enhancement_vast",      tier=3, roles={1,1,1,1,1}, realName="Vast Enhancement"},
    {name="item_enhancement_greedy",    tier=3, roles={1,1,1,2,2}, realName="Greedy Enhancement"},
    {name="item_enhancement_vampiric",  tier=3, roles={1,1,1,1,1}, realName="Vampiric Enhancement"},
    {name="item_enhancement_nimble",    tier=3, roles={1,1,1,1,1}, realName="Nimble Enhancement"},
    {name="item_enhancement_crude",     tier=3, roles={1,1,1,1,1}, realName="Crude Enhancement"},
    {name="item_enhancement_titanic",   tier=3, roles={1,1,1,1,1}, realName="Titanic Enhancement"},

    -- Tier 4
    {name="item_enhancement_mystical",  tier=4, roles={1,1,1,1,1}, realName="Mystical Enhancement"},
    {name="item_enhancement_brawny",    tier=4, roles={1,1,3,2,2}, realName="Brawny Enhancement"},
    {name="item_enhancement_alert",     tier=4, roles={1,2,1,1,1}, realName="Alert Enhancement"},
    {name="item_enhancement_tough",     tier=4, roles={1,1,2,2,1}, realName="Tough Enhancement"},
    {name="item_enhancement_quickened", tier=4, roles={1,1,1,2,1}, realName="Quickened Enhancement"},
    {name="item_enhancement_vampiric",  tier=4, roles={1,1,1,1,1}, realName="Vampiric Enhancement"},
    {name="item_enhancement_timeless",  tier=4, roles={1,1,1,1,1}, realName="Timeless Enhancement"},
    {name="item_enhancement_nimble",    tier=4, roles={1,1,1,1,1}, realName="Nimble Enhancement"},
    {name="item_enhancement_crude",     tier=4, roles={1,1,1,1,1}, realName="Crude Enhancement"},
    {name="item_enhancement_titanic",   tier=4, roles={1,1,1,1,1}, realName="Titanic Enhancement"},

    -- Tier 5
    {name="item_enhancement_timeless",    tier=5, roles={1,1,1,1,1}, realName="Timeless Enhancement"},
    {name="item_enhancement_feverish",    tier=5, roles={1,1,1,1,1}, realName="Feverish Enhancement"},
    {name="item_enhancement_fleetfooted", tier=5, roles={1,1,1,1,1}, realName="Fleetfooted Enhancement"},
    {name="item_enhancement_audacious",   tier=5, roles={1,1,1,1,1}, realName="Audacious Enhancement"},
    {name="item_enhancement_evolved",     tier=5, roles={1,1,1,1,1}, realName="Evolved Enhancement"},
    {name="item_enhancement_boundless",   tier=5, roles={1,1,1,1,1}, realName="Boundless Enhancement"},
    {name="item_enhancement_wise",        tier=5, roles={1,1,1,1,1}, realName="Wise Enhancement"},
    {name="item_enhancement_hulking",     tier=5, roles={1,1,1,1,1}, realName="Hulking Enhancement"},
    {name="item_enhancement_manic",       tier=5, roles={1,1,1,1,1}, realName="Manic Enhancement"},
}

return {
    items        = items,
    enhancements = enhancements,
}
