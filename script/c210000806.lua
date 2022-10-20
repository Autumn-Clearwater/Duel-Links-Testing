--Volcanic Burning Deck
function c210000806.initial_effect(c)
	--Activate
	aux.AddSkillProcedure(c,2,false,nil,nil)
	local e1=Effect.CreateEffect(c)
	e1:SetProperty(EFFECT_FLAG_UNCOPYABLE+EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_STARTUP)
	e1:SetCountLimit(1)
	e1:SetRange(0x5f)
	e1:SetLabel(0)
	e1:SetOperation(s.op)
	c:RegisterEffect(e1)
end
function s.op(e,tp,eg,ep,ev,re,r,rp)
	if e:GetLabel()==0 then
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		e1:SetCode(EVENT_PREDRAW)
		e1:SetCondition(s.flipcon)
		e1:SetOperation(s.flipop)
		Duel.RegisterEffect(e1,tp)
	end
	e:SetLabel(1)
end
function s.flipcon(e,tp,eg,ep,ev,re,r,rp)
	--condition
	return Duel.GetCurrentChain()==0 and Duel.GetTurnCount()==1
end
function s.flipop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SKILL_FLIP,tp,id|(1<<32))
	Duel.Hint(HINT_CARD,tp,id)
	--skill effect
--Add 2 Volcanic Shells and 1 Volcanic Doomfire, Blaze Accelerator, Tri-Blaze Accelerator
	local card1=Duel.CreateToken(tp,33365932)
	local card2=Duel.CreateToken(tp,33365932)
	local card3=Duel.CreateToken(tp,32543380)
	local card4=Duel.CreateToken(tp,69537999)
	local card5=Duel.CreateToken(tp,21420702)
-- create a group containing the cards
	local g=Group.FromCards(card1,card2,card3,card4,card5)
-- put the cards to the deck
	Duel.SendtoDeck(g,tp,SEQ_DECKSHUFFLE,REASON_EFFECT)
end