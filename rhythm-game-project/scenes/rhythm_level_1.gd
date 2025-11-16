extends Node2D

@onready var chartnote = preload("res://objects/chartnote.tscn")

var music1 = [Vector2(-1, 0), Vector2(1, 96), Vector2(1, 240), Vector2(1, 288), Vector2(-1, 384), Vector2(-1, 528), Vector2(-1, 624), Vector2(1, 672), Vector2(1, 768), Vector2(1, 864), Vector2(-1, 1008), Vector2(-1, 1056), Vector2(-1, 1152), Vector2(-1, 1248), Vector2(-1, 1344), Vector2(-1, 1440), Vector2(-1, 1536), Vector2(1, 1632), Vector2(1, 1776), Vector2(1, 1824), Vector2(1, 1920), Vector2(1, 2016), Vector2(-1, 2160), Vector2(-1, 2208), Vector2(-1, 2304), Vector2(-1, 2400), Vector2(1, 2544), Vector2(1, 2592), Vector2(-1, 2688), Vector2(-1, 2784), Vector2(-1, 2880), Vector2(-1, 3072), Vector2(1, 3168), Vector2(1, 3240), Vector2(1, 3264), Vector2(1, 3312), Vector2(-1, 3360), Vector2(-1, 3456), Vector2(1, 3552), Vector2(1, 3696), Vector2(-1, 3744), Vector2(-1, 3840), Vector2(1, 3936), Vector2(-1, 4032), Vector2(-1, 4080), Vector2(1, 4128), Vector2(1, 4224), Vector2(1, 4320), Vector2(1, 4416), Vector2(1, 4512), Vector2(1, 4536), Vector2(1, 4608), Vector2(1, 4704), Vector2(-1, 4800), Vector2(-1, 4854), Vector2(-1, 4896), Vector2(-1, 4992), Vector2(-1, 5088), Vector2(-1, 5232), Vector2(1, 5280), Vector2(1, 5376), Vector2(-1, 5472), Vector2(-1, 5616), Vector2(1, 5664), Vector2(1, 5760), Vector2(1, 5856), Vector2(1, 5952), Vector2(1, 6048), Vector2(1, 6072), Vector2(-1, 6144), Vector2(1, 6240), Vector2(1, 6384), Vector2(1, 6432), Vector2(-1, 6528), Vector2(-1, 6624), Vector2(1, 6768), Vector2(-1, 6816), Vector2(1, 6912), Vector2(1, 7008), Vector2(1, 7152), Vector2(1, 7200), Vector2(1, 7296), Vector2(1, 7392), Vector2(1, 7536), Vector2(-1, 7608), Vector2(-1, 7680), Vector2(-1, 7776), Vector2(-1, 7920), Vector2(1, 7968), Vector2(1, 8064), Vector2(-1, 8160), Vector2(1, 8304), Vector2(-1, 8352), Vector2(-1, 8448), Vector2(1, 8544), Vector2(1, 8688), Vector2(1, 8784), Vector2(1, 8832), Vector2(-1, 8928), Vector2(-1, 9072), Vector2(-1, 9120)]

# Called when the node enters the scene tree for the first time.
func _ready():
	#Signalbus.connect("instantiate_note", _instantiate_new_note)
	_begin_playblack()

func _begin_playblack():
	var temp_y_side = music1[0].x
	_instantiate_new_note(temp_y_side)
	#print("Timestamp 1: " + str(Time.get_ticks_msec()))
	await get_tree().create_timer(1.951).timeout
	get_node("AudioStreamPlayer").play()
	for i in range(music1.size() - 1):
		await get_tree().create_timer(_difference_play(i)).timeout
		temp_y_side = music1[i].x
		_instantiate_new_note(temp_y_side)

func _difference_play(i: int) -> float:
	var difference
	if i == music1.size() - 1:
		difference = music1[-1].y - music1[-2].y
	else:
		difference = music1[i + 1].y - music1[i].y
		#print(difference)
	return difference * 0.001 * 7.353

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _instantiate_new_note(y_side):
	var flnt_inst = chartnote.instantiate()
	
	call_deferred("add_child", flnt_inst)
	flnt_inst.Setup(y_side)
