extends  RigidBody2D

var bullet_scene = preload("res://Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


func _on_shoot_timer_timeout() -> void:
	var bullet_instance = bullet_scene.instantiate()
	bullet_instance.global_position = global_position
	#print('player and bullet pos ',bullet_instance.global_position)
	#bullet_instance.position=Vector2(0,0)
	#print('--',bullet_instance.position)
	#add_child(bullet_instance)
	#print(get_tree().get_current_scene())
	get_tree().get_current_scene().add_child(bullet_instance)
	#rint('init 子弹')
	pass # Replace with function body.
