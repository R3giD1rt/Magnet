extends CharacterBody2D
@onready var MagnetObject = $Anchor/Magnet

var casting = false
func _process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y = move_toward(velocity.y,90,0.6)
	else:
		velocity.y = 0
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		MagnetObject.on = true
		casting = true
	else :
		MagnetObject.on = false
		casting = false
	
	var dir = Input.get_axis("ui_left","ui_right")
	
	if dir:
		velocity.x = 40 * dir
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y -=  300
	if not casting:
		move_and_slide()
	
	
	
