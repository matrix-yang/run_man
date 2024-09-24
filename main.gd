extends Node

@export var prop_scene :PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_prop_timer_timeout() -> void:
	#print('time out')
	var prop = prop_scene.instantiate()
	add_child(prop)
