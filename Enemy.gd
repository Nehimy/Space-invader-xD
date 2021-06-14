extends Area2D


var screen_size
var mob_types
# ---- n y nn son varible que incrementan ----
var n = 2
var nn = 1
#---------------------------------------------
var speed = 20
var i = 1

func _ready():
	add_to_group('GrupoEnemigos')
	screen_size = get_viewport_rect().size





#func _process(delta):
#
#	pass
	
#------Movimiento unitario de las naves------
func mover():

		match(i):
			1: #Move derecha
				if((position.x + 87) < screen_size.x):
					position.x += 1
				else:
					get_tree().call_group('GrupoEnemigos', 'CambiarMovimiento_x_Negativo')
			2: #Move Izquierda
				if((position.x - 87) > 0):
					position.x -= 1
				else:
					get_tree().call_group('GrupoEnemigos', 'CambiarMovimiento_y')

			3: #Move abajo
				if(position.y + 152 < screen_size.y):
					position.y += 89
					get_tree().call_group('GrupoEnemigos', 'CambiarMovimiento_x_Positivo')

func CambiarMovimiento_x_Negativo():
	i=2
		
func CambiarMovimiento_y():
	i=3

func CambiarMovimiento_x_Positivo():
	i=1
#------Cambio de naves------
var e = 0
func CambioDeNave():
		mob_types = $AnimatedSprite.frames.get_animation_names()
		match(nn):
			1:
				$AnimatedSprite.animation = mob_types[n]
				n = n - 1
				nn = 2
			2:
				$AnimatedSprite.animation = mob_types[n]
				n = n - 1
				nn = 3
			3:
				$AnimatedSprite.animation = mob_types[n]
				n = 2
				nn = 1
