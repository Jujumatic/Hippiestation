/obj/effect/countdown/clonepod	//hippie start, re-add cloning
	name = "cloning pod countdown"
	color = "#18d100"
	text_size = 1

/obj/effect/countdown/clonepod/get_value()	//hippie end, re-add cloning
	var/obj/machinery/clonepod/C = attached_to
	if(!istype(C))
		return
	else if(C.occupant)
		var/completion = round(C.get_completion())
		return completion
