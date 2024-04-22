local areaArr = { CUSTOM_AREA_CIRCLE3_1, CUSTOM_AREA_CIRCLE3_2, CUSTOM_AREA_CIRCLE3_3, CUSTOM_AREA_CIRCLE3_4 }
local combatArr = {}
local delay = 0;

for i = 1,4 do
    combatArr[i] = Combat()
    combatArr[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
    combatArr[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
    combatArr[i]:setArea(createCombatArea(areaArr[i]))
end

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
        if i > 0 then
            delay = (i - 1) * 250
            addEvent(castSpell, delay, creature:getId(), variant, i)
            addEvent(castSpell, delay + 1000, creature:getId(), variant, i)
            addEvent(castSpell, delay + 2000, creature:getId(), variant, i)
        end
    end
	return true
end