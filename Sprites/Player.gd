extends KinematicBody2D


# Declare member variables here. Examples:
export (int) var velocidad
var movimiento
var lives
var points


# Called when the node enters the scene tree for the first time.
func _ready():
	lives = 3
	points = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Reiniciar vector
	movimiento = Vector2()
	
	# Capturar flechas del teclado
	if Input.is_action_pressed("ui_right"):
		movimiento.x += 1
	elif Input.is_action_pressed("ui_left"):
		movimiento.x -= 1
	elif Input.is_action_pressed("ui_up"):
		movimiento.y -= 1
	elif Input.is_action_pressed("ui_down"):
		movimiento.y += 1
	
	# Movimientos normalizados
	movimiento = movimiento.normalized() * velocidad
	movimiento = move_and_slide(movimiento)
	
	if movimiento.x>0:
		$AnimatedSprite.animation = "Derecha"
	elif movimiento.x<0:
		$AnimatedSprite.animation = "Izquierda"
	elif movimiento.y<0:
		$AnimatedSprite.animation = "Arriba"
	elif movimiento.y>0:
		$AnimatedSprite.animation = "Abajo"
	elif lives == 0:
		$AnimatedSprite.animation = "dead"
	else:
		$AnimatedSprite.animation = "Idle"


func hit_coin(body):
	points += 1
	print(points)
	body.get_node("Audio").play()
	body.get_node("Collision").set_deferred("disabled", true)
	body.hide()


func hit_enemy(body):
	if lives > 0:
		lives -= 1
	print(lives)
	body.get_node("Audio").play()
