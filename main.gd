extends Node2D

@onready var mensaje = $UI/CenterContainer/Mensaje

func win():
	mensaje.text = "GANASTE"
	get_tree().paused = true

func lose():
	mensaje.text = "PERDISTE"
	get_tree().paused = true
