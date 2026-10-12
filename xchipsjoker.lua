SMODS.current_mod.badge_colour = G.C.CHIPS

SMODS.Atlas({
	key = "xchipsjoker",
	path = "xchipsjoker.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "xchipsjoker",
	cost = 6,
	rarity = 2,
	config = {
		extra = {
			xchips = 1,
			xchips_gain = 0.25,
		},
	},
	atlas = "xchipsjoker",
	perishable_compat = false,
	eternal_compat = true,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.xchips_gain,
				card.ability.extra.xchips,
			},
		}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xchips = card.ability.extra.xchips,
			}
		end
		if context.end_of_round and context.main_eval and not context.blueprint then
			SMODS.scale_card(card, {
				ref_table = card.ability.extra,
				ref_value = "xchips",
				scalar_value = "xchips_gain",
				no_message = true,
			})
			return {
				message = localize({
					type = "variable",
					key = "a_xchips",
					vars = { card.ability.extra.xchips },
				}),
				colour = G.C.CHIPS,
			}
		end
	end,
})
