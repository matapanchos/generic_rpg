extends KinematicBody2D


# Declare member variables here. Examples:
var movimiento


# Called when the node enters the scene tree for the first time.
func _ready():
	movimiento = Vector2()
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var dir = rand_range(0,4)
	
	if dir<1:
		movimiento.x += 1
	elif dir<2:
		movimiento.x -= 1
	elif dir<3:
		movimiento.y -= 1
	elif dir<4:
		movimiento.y += 1
	
	movimiento = movimiento.normalized()
	movimiento.x *= rand_range(100,250)
	movimiento.y *= rand_range(100,250)
	
	movimiento = move_and_slide(movimiento)
	
	if movimiento.x>0:
		$AnimatedSprite.animation = "Derecha"
	elif movimiento.x<0:
		$AnimatedSprite.animation = "Izquierda"
	elif movimiento.y<0:
		$AnimatedSprite.animation = "Arriba"
	elif movimiento.y>0:
		$AnimatedSprite.animation = "Abajo"
	else:
		$AnimatedSprite.animation = "Idle"
