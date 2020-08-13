extends Area2D
export(int) var Velocidad
var Movimiento = Vector2()  
var Limite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Limite = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Movimiento = Vector2()
	if Input.is_action_pressed("ui_right"):#Derecha 
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):#Izquierda
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):#Abajo
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"):#Arriba
		Movimiento.y -= 1
	if Movimiento.length() > 0: # verificar si se esta moviendo
		Movimiento = Movimiento.normalized() * Velocidad #normalizar la velocidad
	position += Movimiento * delta 
	position.x = clamp(position.x, 0, Limite.x)
	position.y = clamp(position.y, 0, Limite.y)
	
