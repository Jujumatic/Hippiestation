//TO DO:
//STEAM EFFECT THAT SPREADS AND APPLIES REAGENTS TO MOBS, THEN ANYTHING REMAINING MELTS INTO REAGENTPILES AFTER
//HAVE OBJECTS GET SPRAYED WITH REAGENTS? COMES UP IN DESCRIPTION. WHEN YOU PICK UP IT APPLIES TOUCH EFFECT TO IT
//SOLIDIFIED AND EDIBLE CHEMICALS, IF MIXED WITH FOOD IT PUTS REAGENTS INTO FOOD, SAME IF IT GOES INTO FRIER? STEAM WILL CONTAMINATE FOOD WITH REAGENTS SAME AS ABOVE
//SMOKE WILL BE SIMILAR TO OLD REACTION WHERE IT OBSCURES VISION, THEN DEPENDING ON TEMPERATURE WILL REVERT INTO EITHER STEAM AND TURN INTO LIQUID REAGENTPILE, OR TURN DIRECTLY INTO LIQUID REAGENTPILE
//SCOOPING UP A CHEMPILE WILL RETURN THE EXACT AMOUNT SCOOPED UP - MAKE SMOKE, STEAM ETC SPREAD REAGENTS EVENLY BASED ON THE CONTAINER, INCREASE AMOUNT SPAWNED IF NEEDED LATER


/datum/reagent
	var/meltingTemperature = 273	//below 273 solidifies
	var/boilingTemperature = 500	//below 500 liquifies



/obj/item/reagent_containers/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)	//TO-DO handle reactions before this, so we can determine if this should gasify or just splash etc
	. = ..()																				//CALL HANDLE REACTIONS BEFORE PARENT PROC, BECAUSE BARTENDER WILL NEVER BE ABLE TO SPILL CONTENTS OTHERWISE
	SplashReagents(hit_atom, TRUE)

/// Handle any reactions possible in this holder
/// Also UPDATES the reaction list
/// High potential for infinite loopsa if you're editing this.
/datum/reagents/handle_reactions()
	. = ..()
	if(chem_temp < meltingTemperature && !(reagent_state == SOLID))	//solidify
		reagent_state = SOLID




	if(chem_temp < boilingTemperature && !(reagent_state == LIQUID))	//liquify
		reagent_state = LIQUID



	if(chem_temp >= boilingTemperature && !(reagent_state == GAS))	//boil
		reagent_state = GAS
