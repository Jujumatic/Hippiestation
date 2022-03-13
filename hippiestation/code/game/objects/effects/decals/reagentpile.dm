/obj/effect/decal/cleanable/reagentchempile	//renamed to reagentpile because chem_pile exists
	name = "Chemicals"
	description = "An indiscernible mixture of chemicals"
	icon = 'hippiestation/icons/effects/32x32.dmi'
	icon_state = "chempile"
	mergeable_decal = FALSE

/obj/effect/decal/cleanable/reagentpile/examine(mob/user)
	. = ..()
	. += "It contains:"
	if(reagents.reagent_list.len)
		if(user.can_see_reagents()) //Show each individual reagent
			for(var/datum/reagent/R in reagents.reagent_list)
				. += "[R.volume] units of [R.name]"
		else //Otherwise, just show the total volume
			var/total_volume = 0
			for(var/datum/reagent/R in reagents.reagent_list)
				total_volume += R.volume
			. += "[total_volume] units of various reagents"
	else
		. += "Nothing."

/obj/effect/decal/cleanable/reagentpile/Crossed(mob/user)
	. = ..()
	var/mob/living/M = user	//now dead mobs will absorb the reagents too... dead mobs used as sponges!
	var/protection = 1
	if(reagents && reagent.list)
		if(M.body_position == LYING_DOWN)	//if they're lying down, they'll absorb more and through their chest instead
			for(var/obj/item/I in M.get_equipped_items())
				if(I.body_parts_covered & CHEST)
					protection = I.permeability_coefficient + 0.5
					break
				else
					protection = 2
		else	//assume they're standing otherwise
			for(var/obj/item/I in M.get_equipped_items())
				if(I.body_parts_covered & FEET)
					protection = I.permeability_coefficient
					break
		reagents.trans_to(M, 2, protection)	//this amount will be removed from the reagentpile
