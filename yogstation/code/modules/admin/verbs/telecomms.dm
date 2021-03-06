/client/proc/reset_all_tcs()
	set category = "Admin"
	set name = "Reset Telecomms Scripts"
	set desc = "Blanks all telecomms scripts from all telecomms servers"
	if(!holder)
		to_chat(usr, "Admin only.")
		return
	
	if(check_rights(R_ADMIN,1))
		var/confirm = alert(src, "You sure you want to blank all NTSL scripts?", "Confirm", "Yes", "No")
		if(confirm !="Yes") return

		for(var/obj/machinery/telecomms/server/S in world)
			var/datum/TCS_Compiler/C = S.Compiler
			S.rawcode = ""
			S.autoruncode = FALSE
			C.Compile("")
		for(var/obj/machinery/computer/telecomms/traffic/T in world)
			T.storedcode = ""
		log_game("[key_name_admin(usr)] blanked all telecomms scripts.")
		message_admins("[key_name_admin(usr)] blanked all telecomms scripts.")
