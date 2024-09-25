extends Area2D
@export var speed = 1000 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@export var direction = 0
@export var player :PackedScene
var min_x
var max_x
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	min_x=0.25*screen_size.x
	max_x=0.75*screen_size.x
	#var height = $CollisionShape2D.shape.size.y
	position=Vector2(0.5*screen_size.x,screen_size.y*0.75)
	
	for i in range(10):
		#初始化一个player实例
		var pr = player.instantiate()
		add_child(pr)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print('plyer group',position)
	if Input.is_action_pressed("right"):
		#direction=+1
		position=Vector2(max_x,screen_size.y*0.75)
	if Input.is_action_pressed("left"):
		#direction=-1
		position=Vector2(min_x,screen_size.y*0.75)
	#position.x += direction * speed * delta
	#position = position.clamp(Vector2(min_x,0), Vector2(max_x,screen_size.y))
