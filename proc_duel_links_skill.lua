DUEL_LINKS_SKILL_COVER =   300000002

function Auxiliary.GetCharacter(c,coverNum)
    return SKILL_COVER+(coverNum*1000000)+(c:GetOriginalAttribute)+(c:GetOriginalRace())
end