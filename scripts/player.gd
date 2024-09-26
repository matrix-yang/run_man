extends Area2D
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@export var direction = 0
var min_x
var max_x
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	min_x=0.25*screen_size.x
	max_x=0.75*screen_size.x
	var height = $CollisionShape2D.shape.size.y
	position=Vector2(0.5*screen_size.x,screen_size.y-height*scale.y*0.6)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		direction=+1
	if Input.is_action_pressed("left"):
		direction=-1
	position.x += direction * speed * delta
	position = position.clamp(Vector2(min_x,0), Vector2(max_x,screen_size.y))
