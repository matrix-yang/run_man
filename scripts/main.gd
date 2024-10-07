extends Node

var prop_scene = preload("res://group_prop.tscn")

var boss = preload("res://boss_1.tscn")

var num_level=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print_tree()
	pass


func _on_prop_timer_timeout() -> void:
	#print('time out')
	#var prop = prop_scene.instantiate()
	#prop.set_meta("prop_pos", 'left')
	#var prop1 = prop_scene.instantiate()
	#prop1.set_meta("prop_pos", 'right')
	#add_child(prop)
	#add_child(prop1)
	num_level+=1
	if randi_range(1,10)%5==0:
		var boss = boss.instantiate()
		add_child(boss)
	else:
		var prop = prop_scene.instantiate()
		add_child(prop)

func _on_boss_timer_timeout() -> void:
	#var boss = boss.instantiate()
	#add_child(boss)
	pass # Replace with function body.
