extends Area2D
signal touch_player
var operator_list=["+", "-", "x", "÷"]
var operator='+'
var num=0
#var window_size
#var prop_pos = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#window_size=get_viewport_rect().size
	#var min_x=0.25*window_size.x
	#var max_x=0.75*window_size.x
	#var height = $Text.size.y
	#prop_pos = get_meta("prop_pos")
	#
	#if prop_pos=='left': 
		#position=Vector2(min_x,height*0.1)
	#else:
		#position=Vector2(max_x,height*0.1)
	# Called every frame. 'delta' is the elapsed time since the previous frame.
	#print(randi() % 25)
	operator = operator_list[randi() % operator_list.size()]
	num=randi() % 20+1
	$Text.text=operator+''+str(num)
	pass
	
func _process(delta: float) -> void:
	#position.y +=  100 * delta
	pass

func _on_area_entered(area: Area2D) -> void:
	print(name,' delect _on_area_entered',area.name)
	touch_player.emit()
