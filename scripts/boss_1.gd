extends Area2D
@export hp=100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var window_size=get_viewport_rect().size
	var min_x=0.25*window_size.x
	#var height = $Prop.size.y
	position=Vector2(min_x,-100)
	$AnimatedSprite2D.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y +=  150 * delta
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#print('-------')
	queue_free()
	pass # Replace with function body.


func _on_body_entered(body: Node) -> void:
	print('---boss ',body.name)
	pass # Replace with function body.
