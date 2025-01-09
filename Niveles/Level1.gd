extends Node2D

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Vidas.text = "Vidas: " + str($Player.lives)
	$Puntos.text = "Puntos: " + str($Player.points)
		
	if($Player.lives <= 0):
		$GameOver.visible = true
		$Player.velocidad = 0
		
	if($Player.points >= 10):
		$YouWon.visible = true
		get_tree().paused = true
