-- invoker_utility.lua
--
-- Factory for Invoker invoke-mechanics helpers.
-- These functions are pure invoke/element mechanics and modifier checks that do
-- not depend on per-frame decision state (botTarget, nEnemyHeroes, etc.).
--
-- Usage (after all ability locals are initialised):
--   local InvokerUtils = require(GetScriptDirectory()..'/FunLib/invoker_utility')
--   local U = InvokerUtils.make({
--     bot          = bot,
--     Invoke       = Invoke,
--     Quas         = Quas,    Wex  = Wex,  Exort = Exort,
--     ColdSnap     = ColdSnap,    GhostWalk     = GhostWalk,
--     Tornado      = Tornado,     EMP           = EMP,
--     Alacrity     = Alacrity,    ChaosMeteor   = ChaosMeteor,
--     Sunstrike    = Sunstrike,   ForgeSpirit   = ForgeSpirit,
--     IceWall      = IceWall,     DeafeningBlast = DeafeningBlast,
--     Cataclysm    = Cataclysm,  -- the string "Cataclysm"
--     AbilityNameMap = AbilityNameMap,
--     J            = J,
--   })

local function make(cfg)
    local bot            = cfg.bot
    local Invoke         = cfg.Invoke
    local Quas           = cfg.Quas
    local Wex            = cfg.Wex
    local Exort          = cfg.Exort
    local ColdSnap       = cfg.ColdSnap
    local GhostWalk      = cfg.GhostWalk
    local Tornado        = cfg.Tornado
    local EMP            = cfg.EMP
    local Alacrity       = cfg.Alacrity
    local ChaosMeteor    = cfg.ChaosMeteor
    local Sunstrike      = cfg.Sunstrike
    local ForgeSpirit    = cfg.ForgeSpirit
    local IceWall        = cfg.IceWall
    local DeafeningBlast = cfg.DeafeningBlast
    local Cataclysm      = cfg.Cataclysm    -- string "Cataclysm"
    local AbilityNameMap = cfg.AbilityNameMap
    local J              = cfg.J

    local U = {}

    -- Push three orb activations onto the action stack (for pre-invoke positioning).
    function U.InvokeElements(Orb1, Orb2, Orb3)
        bot:ActionPush_UseAbility(Orb1)
        bot:ActionPush_UseAbility(Orb2)
        bot:ActionPush_UseAbility(Orb3)
    end

    -- Queue three orb activations (for background element switching).
    function U.QueueElements(Orb1, Orb2, Orb3)
        bot:ActionQueue_UseAbility(Orb1)
        bot:ActionQueue_UseAbility(Orb2)
        bot:ActionQueue_UseAbility(Orb3)
    end

    -- Push Invoke + three orbs onto the action stack to invoke a spell.
    function U.InvokeSpell(Orb1, Orb2, Orb3)
        bot:ActionPush_UseAbility(Invoke)
        bot:ActionPush_UseAbility(Orb1)
        bot:ActionPush_UseAbility(Orb2)
        bot:ActionPush_UseAbility(Orb3)
    end

    -- Invoke the correct orb combination for the given invoked ability.
    function U.InvokeActualSpell(ability)
        local abilityName

        if type(ability) == "string" and ability == 'Cataclysm' then
            abilityName = ability
        else
            abilityName = ability:GetName()
        end

        print(DotaTime()..' - Invoker going to invoke '..abilityName)

        if abilityName == Cataclysm or ability == Sunstrike then
            U.InvokeSpell(Exort, Exort, Exort)
        elseif ability == DeafeningBlast then
            U.InvokeSpell(Quas, Wex, Exort)
        elseif ability == ChaosMeteor then
            U.InvokeSpell(Exort, Exort, Wex)
        elseif ability == ForgeSpirit then
            U.InvokeSpell(Exort, Exort, Quas)
        elseif ability == Alacrity then
            U.InvokeSpell(Wex, Wex, Exort)
        elseif ability == EMP then
            U.InvokeSpell(Wex, Wex, Wex)
        elseif ability == IceWall then
            U.InvokeSpell(Quas, Quas, Exort)
        elseif ability == GhostWalk then
            U.InvokeSpell(Quas, Quas, Wex)
        elseif ability == Tornado then
            U.InvokeSpell(Wex, Wex, Quas)
        elseif ability == ColdSnap then
            U.InvokeSpell(Quas, Quas, Quas)
        else
            print('[ERROR] Tried to invoke unsupported ability: '..abilityName)
            print("Stack Trace:", debug.traceback())
        end
        print(DotaTime()..' - Invoker tried to invoke '..abilityName)
    end

    -- Returns true if the ability is currently shown in the active spell slots.
    function U.IsAbilityAvailableOnSlots(ability)
        return not ability:IsHidden()
    end

    -- Returns true if the ability needs to be invoked before casting (not on slots yet,
    -- but elements are trained and Invoke is ready).
    function U.IsAbilityReadyForInvoke(ability)
        return not U.IsAbilityAvailableOnSlots(ability)
            and U.CanAbilityPossiblyBeCasted(ability)
            and Invoke:IsFullyCastable()
    end

    -- Returns true if the ability is on the active slots and fully castable right now.
    function U.IsAbilityReadyForCast(ability)
        return U.IsAbilityAvailableOnSlots(ability) and ability:IsFullyCastable()
    end

    -- Returns true if the ability could be cast assuming it were on the slots already
    -- (i.e. elements trained, not on cooldown, enough mana).
    function U.CanAbilityPossiblyBeCasted(_ability)
        local sAbility, tAbility
        if type(_ability) == "string" and _ability == 'Cataclysm' then
            sAbility = _ability
            tAbility = Sunstrike
        else
            sAbility = AbilityNameMap[_ability:GetName()]
            tAbility = _ability
        end

        if not U.HaveElementsTrainedToInvokeAbility(_ability) then return false end
        return tAbility:IsFullyCastable()
    end

    -- Returns true if Invoker has levelled the required orbs to invoke the given ability.
    function U.HaveElementsTrainedToInvokeAbility(ability)
        if type(ability) == "string" and ability == Cataclysm then
            return bot:HasScepter() and U.HaveElementsTrainedToInvokeAbility(Sunstrike)
        elseif ability == DeafeningBlast then
            return Quas:IsTrained() and Wex:IsTrained() and Exort:IsTrained()
        elseif ability == ChaosMeteor then
            return Wex:IsTrained() and Exort:IsTrained()
        elseif ability == ForgeSpirit then
            return Quas:IsTrained() and Exort:IsTrained()
        elseif ability == Sunstrike then
            return Exort:IsTrained()
        elseif ability == Alacrity then
            return Wex:IsTrained() and Exort:IsTrained()
        elseif ability == EMP then
            return Wex:IsTrained()
        elseif ability == IceWall then
            return Quas:IsTrained() and Exort:IsTrained()
        elseif ability == GhostWalk then
            return Quas:IsTrained() and Wex:IsTrained()
        elseif ability == Tornado then
            return Quas:IsTrained() and Wex:IsTrained()
        elseif ability == ColdSnap then
            return Quas:IsTrained()
        else
            print('[ERROR] Checks invokability on an unsupported ability')
            print("Stack Trace:", debug.traceback())
        end

        return nil
    end

    -- Checks whether the target has any of the given modifier names.
    -- Returns BOT_ACTION_DESIRE_HIGH if:
    --   * the target has none of the modifiers (safe to cast immediately), OR
    --   * a modifier is present but expires within nDelay seconds.
    -- Returns BOT_ACTION_DESIRE_NONE if modifiers are present but won't expire in time.
    function U.CheckTempModifiers(modifierNames, botTarget, nDelay)
        local countMo = 0
        if botTarget == nil then return BOT_ACTION_DESIRE_NONE, countMo end

        for _, mName in pairs(modifierNames) do
            if botTarget:HasModifier(mName) then
                countMo = countMo + 1
                local remaining = J.GetModifierTime(botTarget, mName)
                print(DotaTime().." - Target has modifier "..mName..", the remaining time: " .. tostring(remaining) .. " seconds, delay: "..tostring(nDelay))
                if remaining > 0 and remaining <= nDelay then
                    return BOT_ACTION_DESIRE_HIGH
                end
            end
        end
        -- No such modifiers present — safe to cast directly.
        if countMo == 0 then
            return BOT_ACTION_DESIRE_HIGH
        end

        return BOT_ACTION_DESIRE_NONE
    end

    -- Returns true if the enemy hero is under a long-duration hard crowd-control effect
    -- (e.g. Black Hole pull, Fiend's Grip, Duel, Ravage, Chronosphere, Reverse Polarity).
    function U.IsUnderLongDurationStun(enemyHero)
        return enemyHero:HasModifier('modifier_bane_fiends_grip')
            or enemyHero:HasModifier('modifier_legion_commander_duel')
            or enemyHero:HasModifier('modifier_enigma_black_hole_pull')
            or enemyHero:HasModifier('modifier_faceless_void_chronosphere_freeze')
            or enemyHero:HasModifier('modifier_magnataur_reverse_polarity')
            or enemyHero:HasModifier('modifier_tidehunter_ravage')
    end

    return U
end

return { make = make }
