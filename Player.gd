extends Area2D


export var speed = 300
var screen_size
onready var _animated_sprite = $AnimatedSprite


func _ready():
	screen_size = get_viewport_rect().size
	
	
func _process(delta):
	#hide()
	MoverNave(delta)
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		#_animated_sprite.play("run")
		_animated_sprite.play()
		$AnimatedSprite.animation = "Move"
		
	else:
		_animated_sprite.stop()
		$AnimatedSprite.animation = "Still"
		
		
	
var distanciaFrame	 
var velocidad	
func MoverNave(delta):
	velocidad = Vector2(0,0)
	if Input.is_action_pressed("ui_left"):
		velocidad.x = velocidad.x - 1
	if Input.is_action_pressed("ui_right"):
		velocidad.x = velocidad.x + 1
	
	velocidad = velocidad.normalized() * speed
	distanciaFrame = velocidad * delta

	position = position + distanciaFrame #actualsar la pocsition nave
	position.x = clamp(position.x, 43, screen_size.x-43)
