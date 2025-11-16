extends Control

var cur_score : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#var chartnote = get_parent().get_node("chartnote")
	#chartnote.connect("incr_score", _incr_score)
	Signalbus.connect("incr_score", _incr_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _incr_score():
	print("incr score is triggering!")
	cur_score += 100
	%ScoreLabel.text =  "Score: " + str(cur_score)
