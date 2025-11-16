extends Sprite2D

signal user_pressed(bar_side)
signal instantiate_note(y_side)
@export var key_name: String = ""
@export var swap_key: String = ""
var swap_side = -1
#for swap side, -1 indicates left side, 1 indicates right side

var chart_note_queue = []

@onready var chartnote = preload("res://objects/chartnote.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed(key_name):
		#print(key_name)
		#user_pressed.emit(swap_side)
		
		#depreciated code, might have to delete
		#print(key_name + " Was just pressed")
		Signalbus.emit_signal("user_pressed", swap_side)
		
		#key_name = "shitfuck"
		#print(key_name)
	if Input.is_action_just_pressed(swap_key):
		swap_side *= -1
		
		if swap_side == -1:
			position.y = -87.0
		else:
			position.y = 101.0
			
		#position.x *= -1
		print(swap_side)
		
	if Input.is_action_just_pressed("button_d"):
		_create_chartnote()

func _create_chartnote():
	#Signalbus.emit_signal("instantiate_note", swap_side)
	
	var flnt_inst = chartnote.instantiate()
	#print(get_node("/root/RhythmLevel1d"))
	#flnt_inst.reparent(get_node("/root/RhythmLevel1"))
	get_tree().get_root().call_deferred("add_child", flnt_inst)
	#setting init_x_side as 1 for testing purposes. It should read from input file
	#for chart
	#var init_x_side = 1
	flnt_inst.Setup(swap_side)
	#flnt_inst.connect(user_pressed)
	
	#chart_note_queue.push_back(flnt_inst)
	
