extends Sprite2D
@onready var animator = $"../AnimationPlayer"

var lastdir = 1
var wasairbourne = false
func  _physics_process(delta: float) -> void:
	
	if $"..".is_on_floor():
		if wasairbourne:
			wasairbourne = false
			self.scale = Vector2(0.20,0.10)
	else:
		wasairbourne = true
	
	
	
	
	var dir = Input.get_axis("ui_left","ui_right")
	
	if dir  :
		lastdir = dir
		animator.play("Walk")
	else:
		if $"..".is_on_floor() and not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			animator.play("CRESET")
	
	if lastdir == 1:
		self.flip_h = false
	else:
		self.flip_h = true
	
	if Input.is_action_just_pressed("ui_accept"):
		animator.play("Jump")
		self.scale = Vector2(0.10,0.20)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		animator.play("Casting")
	
	
	self.scale.x = move_toward(self.scale.x,0.15,0.2 * delta)
	self.scale.y = move_toward(self.scale.y,0.15,0.2 * delta)
	
