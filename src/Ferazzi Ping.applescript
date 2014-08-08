# 
# Ferrazzi Ping script inspired by Never Eat Alone by Keith Ferrazzi
# initial version by Peter Edstrom
# peter@edstrom.net, August 2014
#

global folks

tell application "Contacts"
	set folks to people of group "ToBeContactedIn2014"
	
	#set n to the number of items in folks
	#repeat with i from 1 to number of items in folks
	
	repeat 3 times
		set r to (random number from 1 to (number of items in folks))
		set thisPerson to item r of folks
		set contactEmails to emails of thisPerson
		if (count of contactEmails) ≥ 1 then
			set contactEmailAddress to the value of item 1 of contactEmails
			#display dialog contactEmailAddress
			tell application "Mail"
				set theMessage to make new outgoing message with properties {visible:true, subject:""}
				tell theMessage
					make new to recipient at end of to recipients with properties {address:contactEmailAddress}
				end tell
			end tell
			set newNote to "Auto check-in date: " & (current date) & "
---
" & (the note of thisPerson)
			set note of thisPerson to newNote
			save thisPerson
		end if
		
		remove thisPerson from group "ToBeContactedIn2014"
		save thisPerson
	end repeat
end tell

