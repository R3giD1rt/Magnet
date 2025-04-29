extends Node2D
@export var on :bool
@export var charge : bool
@onready var anchor =$".."
var offset = 45



func _process(delta: float) -> void:
	
	
	
	anchor.rotate(anchor.get_angle_to(get_global_mouse_position()))
	if on == false:
		var tween = create_tween()
		tween.tween_property(self,"position",$"..".position,0.1)
		self.visible = false
	else :
		self.visible = true
		var tween = create_tween()
		tween.tween_property(self,"position",$"..".position + Vector2(offset,0),0.5)
