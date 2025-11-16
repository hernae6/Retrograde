extends Sprite2D

var note_speed = 500.0
var init_x_pos = 438.0

signal incr_score


# Called when the node enters the scene tree for the first time.
func _ready():
	Signalbus.connect("user_pressed", _timingcheck)
	#var judgementbar = get_parent().get_node("judgementbar")
	#var judgementbar = get_parent().get_node("judgementbar")
	#judgementbar.connect("user_pressed", _timingcheck)
	print("X coord: " + str(position.x))
	print("Y coord: " + str(position.y))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	# where Vector2 is basically a 2D point's coordinates 
	position += Vector2(-note_speed * delta, 0)

	if position.x < -700:
		#print("FUUUUUUUUCKKKKKKKKKKKKKK")
		queue_free()

func _timingcheck(bar_side):
	#print(key_pressed + " got pressed!")
	
	if bar_side == -1 && position.y < 1:
		if position.x > -585.0 && position.x < -480.0:
			#print("Timestamp 2: " + str(Time.get_ticks_msec()))
			print("achieved timing on side " + str(bar_side))
			#incr_score.emit()
			print(Signalbus.emit_signal("incr_score"))
			#get_parent().get_node("ScoreUI").incr_score()
			queue_free()
	
	elif bar_side == 1 && position.y > 1:
		if position.x > -585.0 && position.x < -480.0:
			print("achieved timing on side " + str(bar_side))
			Signalbus.emit_signal("incr_score")
			queue_free()
			

func Setup(init_y_side : float):
	scale = Vector2(0.086, 9.393)
	var init_y
	var init_x_new = init_x_pos
	if init_y_side == -1:
		init_y = -86.75
		print("hello")
	else:
		init_y = 102.0
	
	
		
	#print("This is where we are spawning this fucking thing: " + str(init_x) + " " + str(init_y_pos))
	position = Vector2(init_x_new, init_y)
	
	#Signalbus.connect("user_pressed", _timingcheck)
	#var judgementbar = $judgementbar
	#judgementbar.connect("user_pressed", _timingcheck)
	
