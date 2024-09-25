extends Node2D
var window_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	window_size=get_viewport_rect().size
	var min_x=0.25*window_size.x
	#var height = $Prop.size.y
	position=Vector2(0.5*window_size.x,20)
	$Prop.position=Vector2(min_x,1)
	$Prop2.position=Vector2(-min_x,1)
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y +=  150 * delta
	#print(position)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.


func _on_prop_touch_player() -> void:
	#print(position)
	queue_free()
	pass # Replace with function body.
