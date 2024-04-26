local areaArr = { CUSTOM_AREA_CIRCLE3_1, CUSTOM_AREA_CIRCLE3_2, CUSTOM_AREA_CIRCLE3_3, CUSTOM_AREA_CIRCLE3_4 }
local combatArr = {}
local delay = 0;
local combat = Combat()

/*
Added a function to handle damage not being applied.
*/

-------------------------------------------------------------- add*
function onGetFormulaValues_1(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 5.5) + 25
	local max = (level / 5) + (magicLevel * 11) + 50
	return -min, -max
end

function onGetFormulaValues_2(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 5.5) + 25
	local max = (level / 5) + (magicLevel * 11) + 50
	return -min, -max
end

function onGetFormulaValues_3(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 5.5) + 25
	local max = (level / 5) + (magicLevel * 11) + 50
	return -min, -max
end

function onGetFormulaValues_4(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 5.5) + 25
	local max = (level / 5) + (magicLevel * 11) + 50
	return -min, -max
end
-------------------------------------------------------------- add*

for i = 1,4 do
    combatArr[i] = Combat()
    combatArr[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
    combatArr[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
    combatArr[i]:setArea(createCombatArea(areaArr[i]))
end

-------------------------------------------------------------- add*
combatArr[1]:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_1")
combatArr[2]:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_2")
combatArr[3]:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_3")
combatArr[4]:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_4")
-------------------------------------------------------------- add*

local function castSpell(creatureId, variant, combat_idx)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	combatArr[combat_idx]:execute(creature, variant)
end



function onCastSpell(creature, variant)
    castSpell(creature, variant, 1)
    addEvent(castSpell, 1000, creature:getId(), variant, 1)
    addEvent(castSpell, 2000, creature:getId(), variant, 1)
    for i = 1,4 do
        if i > 1 then
            delay = (i - 1) * 250
            addEvent(castSpell, delay, creature:getId(), variant, i)
            addEvent(castSpell, delay + 1000, creature:getId(), variant, i)
            addEvent(castSpell, delay + 2000, creature:getId(), variant, i)
        end
    end
	return true
end