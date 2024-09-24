extends Area2D
var window_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	window_size=get_viewport_rect().size
	var min_x=0.25*window_size.x
	var max_x=0.75*window_size.x
	var height = $Text.size.y
	
	position=Vector2(min_x,height*0.1)
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y +=  100 * delta


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	#print('exit screen')
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	
	queue_free()
