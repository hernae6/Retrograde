extends Node2D

@export var start_key: String = ""

var progress_counter = 0
var cg_text = [
["Antonio","Lori that's bullshit and you know it!"],
["Lori","Nah nah nah I swear to God, man, I was shotgun with Clarisse and we was rollin' up Seventeenth-"],
["Eddie", "Where they got the old pharmacy?"],
["Lori","Yeah, yeah, that Seventeenth. Seventeenth and Folsom."],
["Lori","We was, like, pullin' up to a light when all of a sudden some dude is just fuckin' saunterin' towards us with his junk out!"],
["Eddie","(laughing) There's no fucking way."],
["Antonio","Holy shit, (laughs) that's decroded."],
["Lori","No seriously, I don't think Clarisse has ever regretted gettin' a convertable more."],
["Antonio","I don't think she ever will."],
["Eddie","Holy shit, Lori. You said Seventeenth and Folsom?"],
["Lori","(laughing) Yeah, yeah, Folsom."],
["Eddie","Guess I'm just never hittin' that part of town ever again. That's so crazy."],
["Antonio","Ed."],
["Eddie","What's good?"],
["Antonio","Our favorite smoke shop's on Seventeenth."],
["Eddie","Fuuuck, it is, isn't it?"],
["Lori","And this is why I don't smoke, fellas."],
["Antonio","(laughing) You're so stupid."],
["", "..."],
["Lori","Fuck me, it's already 2 AM?"],
["Antonio","Oh shit, yeah, I totally lost track of the time."],
["Lori","I gotta get goin', boys- got a gig first thing tomorrow with Dissonant Fifths."],
["Eddie","Dissonant Fifths? Jackson and Diego?"],
["Lori","Yup yup, that Dissonant Fifths."],
["Eddie","No way! You gotta hook me up sometime- I introduced you to Ihunna, remember?"],
["Lori","I woulda had ya even if ya didn't introduce me, dumbass."],
["Eddie","You're the best, Lori."],
["Lori","Yeah yeah yeah, whatever man. Love ya too."],
["Antonio","You need a ride, Lori?"],
["Eddie","Hang on, Tony."],
["Antonio","What's good?"],
["Eddie","Got a light?"],
["Antonio","Uhh..."],
["Lori","I got my own ride, Tony, you good."],
["Antonio","You sure? Alright, yeah, I got a light."],
["Eddie","Get home alright, Lori."],
["Lori","Night, guys."],
["Antonio","Night."],
["Antonio:","..."],
["Eddie","..."],
["Antonio","So... what's good?"],
["Eddie","..."],
["Eddie","I don't wanna get ahead of myself or nothin', but I might be outta my rut."],
["Antonio","No way? Somethin' happen?"],
["Eddie","You remember how I went on a trip northside?"],
["Antonio","'Course, you were gone for a while."],
["Eddie","(laughs) Yeah, guess I was."],
["Antonio","Lori missed ya more than you could ever get the stubborn bastard to admit, y'know."],
["Eddie","Shit, really?"],
["Antonio","Ah, wait, fuck, don't tell her I said that."],
["Eddie","(laughing) I'll consider it."],
["Antonio","No seriously, man, she'll fuckin' kill me. You know how scary she gets."],
["Eddie","(laughing) You're telling me."],
["Antonio","So anyways, what about your trip?"],
["Eddie","Ah, right. Thing is, I'm traveling on my own for a good while, right?"],
["Antonio","Right."],
["Eddie","Can't lie, that shit gave me perspective."],
["Antonio","Yeah?"],
["Eddie","Yeah, on community and shit. My actual family, my found family, friends, acquaintances."],
["Antonio","That's crazy 'cause just the other day I was just thinkin' about how I've honest to God met so many of my people through just"],
["Antonio","crazy like, strings of coincidences."],
["Eddie","Isn't that shit beautiful, though?"],
["Antonio","In a we-are-so-small-in-the-grander-scheme sorta way, yeah."],
["Eddie","(laughs) Yeah, I guess so, yeah."],
["Antonio","So... Edukation's back?"],
["Eddie","I'm thinkin' I'm back."],
["Antonio","'Bout fuckin' time."], ["",""]
]

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AudioStreamPlayer").play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if progress_counter == 38:
		$CG1.visible = false
		$CG2.visible = true
	if progress_counter == 67:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	
	$Textbox_background/Textbox_text.text = cg_text[progress_counter][1]
	$Name_box/Namebox_text.text = cg_text[progress_counter][0]
	
	if Input.is_action_just_pressed(start_key):
		progress_counter += 1
	
#points of interest
