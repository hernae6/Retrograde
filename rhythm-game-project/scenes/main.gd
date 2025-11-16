extends Node2D

@export var start_key: String = ""
@export var debug1: String = ""
@export var debug2: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AudioStreamPlayer").play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_just_pressed(start_key):
		get_tree().change_scene_to_file("res://scenes/vn_section_1.tscn")
		#get_tree().change_scene_to_file("res://scenes/RhythmLevel1.tscn")
	elif Input.is_action_just_pressed(debug1):
		get_tree().change_scene_to_file("res://scenes/RhythmLevel1.tscn")
	elif Input.is_action_just_pressed(debug2):
		get_tree().change_scene_to_file("res://scenes/vn_section_2.tscn")
		
		
