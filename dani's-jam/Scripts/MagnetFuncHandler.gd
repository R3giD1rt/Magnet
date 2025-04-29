extends Area2D


var stre :float = 5000


func _physics_process(delta):
	
	for body in get_tree().get_nodes_in_group("Magnetobjec") :
		if body == self:
			continue
		var p = $Location.get_global_position()
		var bp = body.get_global_position()
		var t = p - bp
		var dir 
		
		
		if $"..".on == true:
			if body.Polarity == "+":
				
				if body in $".".get_overlapping_bodies():
					body.global_position.x = move_toward(body.global_position.x,p.x,3 )
					body.global_position.y = move_toward(body.global_position.y,p.y,3 )
					body.add_constant_central_force(t)
			else:
				if body in $".".get_overlapping_bodies():
					for bodye in $".".get_overlapping_bodies():
						var d = global_position - bodye.global_position
						bodye.global_position += -d.normalized() * 3
					
		else:
			body.constant_force = Vector2.ZERO
