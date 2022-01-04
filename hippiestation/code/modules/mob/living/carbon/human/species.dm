var/obj/item/organ/foreskin/foreskin = C.getorganslot(ORGAN_SLOT_FORESKIN)var/should_have_foreskin = FALSE

	if(C.gender == MALE)
		should_have_foreskin = TRUE

	if(foreskin && (!should_have_foreskin || replace_current))
		foreskin.Remove(C,1)
		QDEL_NULL(foreskin)
	if(should_have_foreskin && !foreskin)
		foreskin = new()
		foreskin.Insert(C)

var/should_have_foreskin = FALSE

	if(C.gender == MALE)
		should_have_foreskin = TRUE

	if(foreskin && (!should_have_foreskin || replace_current))
		foreskin.Remove(C,1)
		QDEL_NULL(foreskin)
	if(should_have_foreskin && !foreskin)
		foreskin = new()
		foreskin.Insert(C)
