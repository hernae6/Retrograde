extends Node2D

@export var start_key: String = ""

var progress_counter = 0
var cg_text = ["Um... this is day... twelve? of analog recording for journaling purposes.",
				"The date is September 15th, solar year 2043. The time is... 1902.", 
				"Sigh.",
				"I don't think I can ever get used to this.",
				"...",
				"I just hope this thing works.",
				"The last couple recordings came out surprisingly well, but the tech is so old,",
				"and I'm not really confident that I can repair it if something goes wrong.",
				"Maybe if we just hadn't given up on this sort of archiving hardware...",
				"But! That's not really important right now.",
				"I finally found one- one of Lolo's tapes.",
				"I think the data's corrupted, but it could honestly be so much worse given its age.",
				"And besides, that's where my new reader comes in anyway.",
				"...",
				"Everyone keeps trying to tell me that I'm wasting my time with obsolete tech, but how else am I supposed to do this?",
				"I made a promise, didn't I?",
				"To meet Lolo from the other side. To touch the past.",
				"...",
				"Alright, tape's slotted in, interface is up. So far so good.",
				"Okay... let's see here...",
				"Two tracks of tape feed into a mono reader on a switch rail.",
				"Now if I'm remembering this correctly...",
				"Spacebar activates the mono reader, and the A key activates the switch rail.",
				"So all I have to do is wait for the corrupted data point to approach the reader, switch to the right track,",
				"then activate the reader just as it makes contact with the data point.",
				"...groovy.",
				"Alright, let's do this."]

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(str(cg_text))
	get_node("AudioStreamPlayer").play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if progress_counter == 1:
		$ColorRect1/Blackscrn_txt.text = cg_text[progress_counter]
	if progress_counter == 2:
		$ColorRect1.visible = false
		$CG1.visible = true
		$Textbox_background.visible = true
		$Textbox_background/Textbox_lbl.text = cg_text[progress_counter]
		$Namebox.visible = true
	elif progress_counter == 13:
		$CG1.visible = false
		$CG2.visible = true
		$Textbox_background/Textbox_lbl.text = cg_text[progress_counter]
	elif progress_counter == 18:
		$CG2.visible = false
		$CG3.visible = true
		$Textbox_background/Textbox_lbl.text = cg_text[progress_counter]
	elif progress_counter == 27:
		get_tree().change_scene_to_file("res://scenes/RhythmLevel1.tscn")
	else:
		$Textbox_background/Textbox_lbl.text = cg_text[progress_counter]
	if Input.is_action_just_pressed(start_key):
		progress_counter += 1
