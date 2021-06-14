extends Node


var screen_size

var x = 126
var y = 42
var i = 1
var ii = 1
var Enemy = load("res://Enemy.tscn")

func _ready():
	add_to_group('Universal')
	NewEnemy()

func NewEnemy():
	x = 80
	while ii <= 6: #6 filas
		while i <= 7: #7 naves
			var MultiEnemigos = Enemy.instance()
			MultiEnemigos.position = Vector2(x, y)
			x +=  126
			add_child(MultiEnemigos)
			i = i + 1
			
		get_tree().call_group('GrupoEnemigos', 'CambioDeNave')
		i = 1
		ii = ii + 1
		y -= 89
		x = 80



func _on_Timer_timeout():
	get_tree().call_group('GrupoEnemigos', 'mover')

#Game over

func _on_Player_area_entered(_area):
	print("game over")
	$Player.hide()
	$Enemy.hide()
	get_node("Timer").stop()
