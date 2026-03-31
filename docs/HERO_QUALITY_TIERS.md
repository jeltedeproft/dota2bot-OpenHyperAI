# Hero Quality Tiers

This document grades the AI implementation quality for each of the 127 hero files in `bots/BotLib/`.
The primary signal is the number of `ConsiderX()` ability-decision functions, combined with overall file size and known implementation notes.

## Grading Criteria

| Tier | ConsiderX fns | What it means |
|------|--------------|---------------|
| **S** | 10 + | Full combo system, mechanic-aware casts (positioning, cancels, chaining) |
| **A** | 7 – 9 | Most abilities covered with meaningful condition checks |
| **B** | 5 – 6 | Core abilities covered; some secondary abilities may be naive or missing |
| **C** | 3 – 4 | Only the most impactful spells get custom logic; rest auto-cast |
| **D** | 0 – 2 | Near-placeholder — buy list exists but almost no ability AI |

> **Note on line count:** A short file is not automatically low-quality if the hero has a simple kit (e.g., Wraith King).
> Conversely, a large file with only basic `ConsiderX` stubs can still be C-tier.

---

## S-Tier — Elite

Full combo awareness, chaining logic, edge-case handling. Good reference for implementing complex heroes.

| Hero | File | Lines | ConsiderX |
|------|------|-------|-----------|
| Invoker | `hero_invoker.lua` | 1798 | 16 |
| Ringmaster | `hero_ringmaster.lua` | 1196 | 12 |
| Tinker | `hero_tinker.lua` | 1502 | 11 |
| Kez | `hero_kez.lua` | 1031 | 10 |
| Magnus | `hero_magnataur.lua` | 1014 | 10 |

**Invoker** is the most complex file in the repo — it has a dedicated utility module (`FunLib/invoker_utility.lua`), full combo tracking, and per-spell position/delay awareness.
**Tinker** handles Rearm cycling and March of the Machines area targeting.
**Ringmaster** covers the full tethering/trap/tent combo chain.

---

## A-Tier — Advanced

All or nearly all abilities covered; good conditions and positioning.

| Hero | File | Lines | ConsiderX |
|------|------|-------|-----------|
| Phoenix | `hero_phoenix.lua` | 895 | 8 |
| Keeper of the Light | `hero_keeper_of_the_light.lua` | 678 | 8 |
| Kunkka | `hero_kunkka.lua` | 822 | 8 |
| Clinkz | `hero_clinkz.lua` | 944 | 7 |
| Timbersaw | `hero_shredder.lua` | 1030 | 7 |

---

## B-Tier — Standard

Core spell logic is solid; some situational abilities are missing or simplified.

### 6 ConsiderX

| Hero | File | Lines |
|------|------|-------|
| Anti-Mage | `hero_antimage.lua` | 651 |
| Beastmaster | `hero_beastmaster.lua` | 804 |
| Brewmaster | `hero_brewmaster.lua` | 677 |
| Crystal Maiden | `hero_crystal_maiden.lua` | 1034 |
| Dazzle | `hero_dazzle.lua` | 872 |
| Disruptor | `hero_disruptor.lua` | 779 |
| Drow Ranger | `hero_drow_ranger.lua` | 790 |
| Ember Spirit | `hero_ember_spirit.lua` | 735 |
| Enigma | `hero_enigma.lua` | 851 |
| Nature's Prophet | `hero_furion.lua` | 748 |
| Grimstroke | `hero_grimstroke.lua` | 709 |
| Hoodwink | `hero_hoodwink.lua` | 615 |
| Marci | `hero_marci.lua` | 589 |
| Muerta | `hero_muerta.lua` | 582 |
| Nyx Assassin | `hero_nyx_assassin.lua` | 556 |
| Pangolier | `hero_pangolier.lua` | 788 |
| Primal Beast | `hero_primal_beast.lua` | 596 |
| Puck | `hero_puck.lua` | 826 |
| Clockwerk | `hero_rattletrap.lua` | 673 |
| Rubick | `hero_rubick.lua` | 789 |
| Shadow Demon | `hero_shadow_demon.lua` | 663 |
| Snapfire | `hero_snapfire.lua` | 776 |
| Techies | `hero_techies.lua` | 1041 |
| Terrorblade | `hero_terrorblade.lua` | 484 |
| Tiny | `hero_tiny.lua` | 769 |
| Treant Protector | `hero_treant.lua` | 672 |
| Tusk | `hero_tusk.lua` | 684 |
| Witch Doctor | `hero_witch_doctor.lua` | 802 |
| Zeus | `hero_zuus.lua` | 716 |

### 5 ConsiderX

| Hero | File | Lines |
|------|------|-------|
| Alchemist | `hero_alchemist.lua` | 650 |
| Ancient Apparition | `hero_ancient_apparition.lua` | 608 |
| Batrider | `hero_batrider.lua` | 773 |
| Bloodseeker | `hero_bloodseeker.lua` | 530 |
| Bristleback | `hero_bristleback.lua` | 631 |
| Centaur Warrunner | `hero_centaur.lua` | 565 |
| Chen | `hero_chen.lua` | 603 |
| Dark Seer | `hero_dark_seer.lua` | 657 |
| Dark Willow | `hero_dark_willow.lua` | 581 |
| Doom | `hero_doom_bringer.lua` | 1209 |
| Earth Spirit | `hero_earth_spirit.lua` | 795 |
| Earthshaker | `hero_earthshaker.lua` | 757 |
| Enchantress | `hero_enchantress.lua` | 547 |
| Jakiro | `hero_jakiro.lua` | 763 |
| Leshrac | `hero_leshrac.lua` | 971 |
| Lich | `hero_lich.lua` | 1097 |
| Lion | `hero_lion.lua` | 1035 |
| Mars | `hero_mars.lua` | 799 |
| Medusa | `hero_medusa.lua` | 675 |
| Meepo | `hero_meepo.lua` | 577 |
| Monkey King | `hero_monkey_king.lua` | 745 |
| Morphling | `hero_morphling.lua` | 1068 |
| Naga Siren | `hero_naga_siren.lua` | 622 |
| Ogre Magi | `hero_ogre_magi.lua` | 1167 |
| Oracle | `hero_oracle.lua` | 580 |
| Slark | `hero_slark.lua` | 648 |
| Sniper | `hero_sniper.lua` | 677 |
| Spectre | `hero_spectre.lua` | 676 |
| Storm Spirit | `hero_storm_spirit.lua` | 554 |
| Tidehunter | `hero_tidehunter.lua` | 876 |
| Visage | `hero_visage.lua` | 503 |
| Warlock | `hero_warlock.lua` | 600 |
| Windrunner | `hero_windrunner.lua` | 879 |

---

## C-Tier — Basic

Only the most impactful spells have custom conditions; several abilities are auto-cast or missing entirely.

### 4 ConsiderX

| Hero | File | Lines |
|------|------|-------|
| Arc Warden | `hero_arc_warden.lua` | 924 |
| Bane | `hero_bane.lua` | 829 |
| Bounty Hunter | `hero_bounty_hunter.lua` | 701 |
| Dawnbreaker | `hero_dawnbreaker.lua` | 625 |
| Death Prophet | `hero_death_prophet.lua` | 663 |
| Dragon Knight | `hero_dragon_knight.lua` | 784 |
| Faceless Void | `hero_faceless_void.lua` | 631 |
| Gyrocopter | `hero_gyrocopter.lua` | 495 |
| Huskar | `hero_huskar.lua` | 681 |
| Juggernaut | `hero_juggernaut.lua` | 580 |
| Largo *(custom)* | `hero_largo.lua` | 777 |
| Lifestealer | `hero_life_stealer.lua` | 535 |
| Lina | `hero_lina.lua` | 851 |
| Luna | `hero_luna.lua` | 575 |
| Mirana | `hero_mirana.lua` | 731 |
| Necrophos | `hero_necrolyte.lua` | 690 |
| Shadow Fiend | `hero_nevermore.lua` | 613 |
| Night Stalker | `hero_night_stalker.lua` | 569 |
| Outworld Destroyer | `hero_obsidian_destroyer.lua` | 536 |
| Omniknight | `hero_omniknight.lua` | 825 |
| Phantom Assassin | `hero_phantom_assassin.lua` | 804 |
| Pudge | `hero_pudge.lua` | 797 |
| Pugna | `hero_pugna.lua` | 780 |
| Queen of Pain | `hero_queenofpain.lua` | 859 |
| Riki | `hero_riki.lua` | 757 |
| Sand King | `hero_sand_king.lua` | 742 |
| Shadow Shaman | `hero_shadow_shaman.lua` | 819 |
| Silencer | `hero_silencer.lua` | 987 |
| Skywrath Mage | `hero_skywrath_mage.lua` | 681 |
| Spirit Breaker | `hero_spirit_breaker.lua` | 555 |
| Troll Warlord | `hero_troll_warlord.lua` | 776 |
| Undying | `hero_undying.lua` | 575 |
| Viper | `hero_viper.lua` | 728 |
| Void Spirit | `hero_void_spirit.lua` | 565 |
| Winter Wyvern | `hero_winter_wyvern.lua` | 902 |

### 3 ConsiderX

| Hero | File | Lines |
|------|------|-------|
| Abyssal Underlord | `hero_abyssal_underlord.lua` | 541 |
| Axe | `hero_axe.lua` | 564 |
| Broodmother | `hero_broodmother.lua` | 575 |
| Chaos Knight | `hero_chaos_knight.lua` | 508 |
| Legion Commander | `hero_legion_commander.lua` | 592 |
| Lone Druid | `hero_lone_druid.lua` | 294 |
| Lycan | `hero_lycan.lua` | 423 |
| Phantom Lancer | `hero_phantom_lancer.lua` | 580 |
| Razor | `hero_razor.lua` | 572 |
| Slardar | `hero_slardar.lua` | 537 |
| Sven | `hero_sven.lua` | 622 |
| Templar Assassin | `hero_templar_assassin.lua` | 804 |
| Ursa | `hero_ursa.lua` | 406 |
| Vengeful Spirit | `hero_vengefulspirit.lua` | 596 |
| Venomancer | `hero_venomancer.lua` | 594 |
| Weaver | `hero_weaver.lua` | 533 |

---

## D-Tier — Minimal / Stub

Very little or no ability logic. Buy lists exist but the AI plays the hero mostly as a right-click bot.

| Hero | File | Lines | ConsiderX | Notes |
|------|------|-------|-----------|-------|
| Io (Wisp) | `hero_wisp.lua` | 236 | 0 | TS-compiled; tether/relocate logic absent |
| Elder Titan | `hero_elder_titan.lua` | 343 | 0 | No ability AI at all |
| Abaddon | `hero_abaddon.lua` | 527 | 2 | Aphotic Shield + Mist Coil only |
| Wraith King | `hero_skeleton_king.lua` | 485 | 2 | Wraithfire Blast + Reincarnation check only |

---

## Special / Non-Player Heroes

These files exist but are not directly player-selectable heroes.

| File | Description |
|------|-------------|
| `hero_lone_druid_bear.lua` | Spirit Bear companion unit for Lone Druid — separate AI file |
| `hero_largo.lua` | Custom / unreleased hero (ability names: `largo_catchy_lick`, `largo_frogstomp`, etc.) |

---

## Improvement Priority

Based on tier + hero popularity/difficulty:

1. **Elder Titan** — D-tier with 0 ability logic; an impactful support that needs Echo Stomp + Earth Splitter AI
2. **Io** — D-tier; Tether + Relocate are highly game-changing abilities with no current logic
3. **Lone Druid** — C-tier at only 294 lines; bear control is in a separate file but overall AI is thin
4. **Wraith King** — 2 ConsiderX for a hero with 4 abilities including Wraithfire Blast slow/stun
5. **Abaddon** — only Aphotic Shield + Mist Coil; Borrowed Time (ultimate) should have defensive activation logic

Heroes already at A/S-tier that could still benefit from refinement:
- **Invoker** — combo cooldown tracking could use further tuning
- **Tinker** — Laser target selection (blind priority) is simplified
