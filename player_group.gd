extends Area2D
@export var speed = 500 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@export var direction = 0
@export var init_count = 1
var total_count = init_count
@export var max_count = 20

var player = preload("res://player.tscn")
var min_x
var max_x
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	min_x=0.25*screen_size.x
	max_x=0.75*screen_size.x
	#var height = $CollisionShape2D.shape.size.y
	position=Vector2(0.5*screen_size.x,screen_size.y*0.75)
	
	for i in range(init_count):
		#初始化一个player实例
		var pr = player.instantiate()
		add_child(pr)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print('plyer group',position)
	if Input.is_action_pressed("right"):
		direction=+1
		#add_count(1)
		#position=Vector2(max_x,screen_size.y*0.75)
	if Input.is_action_pressed("left"):
		#del_count(1)
		direction=-1
		#position=Vector2(min_x,screen_size.y*0.75)
	position.x += direction * speed * delta
	position = position.clamp(Vector2(min_x,0), Vector2(max_x,screen_size.y))

func add_count(count:int)->void:
	if total_count< max_count:
		count=min(count,max_count-total_count)
		total_count+=count
		for i in range(count):
			#初始化一个player实例
			var pr = player.instantiate()
			add_child(pr)
		
func del_count(count:int)->void:
	total_count-=count
	if total_count>0:
		var player_nodes = get_tree().get_nodes_in_group('player')
		for i in range(count):
			var node=player_nodes[i]
			node.queue_free()
	else :
		total_count=0
		var player_nodes = get_tree().get_nodes_in_group('player')
		for node in player_nodes:
			node.queue_free()
		print('GAME OVER')


func _on_area_entered(area: Area2D) -> void:
	#print(area.name,area.operator,area.num)
	if area.operator=='+':
		add_count(area.num)
	elif area.operator=='-':
		del_count(area.num)
	elif area.operator=='x':
		var cnt=(total_count * (area.num-1))
		add_count(cnt)
	elif area.operator=='÷':
		var cnt=int(total_count*(1-1/area.num))
		del_count(cnt)
	else:
		pass
