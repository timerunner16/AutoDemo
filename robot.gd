extends MeshInstance3D

const position_1: Vector3 = Vector3(2,0,2)
const position_2: Vector3 = Vector3(-2,0,-2)
const position_3: Vector3 = Vector3(-2,0,2)

enum states {
	idle,
	moving_to_position_1,
	moving_to_position_2,
	moving_to_position_3
}

var state: states = states.moving_to_position_1

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		state = states.moving_to_position_1
	
	match state:
		states.idle:
			print('wow i finished it')
			if Input.is_action_just_pressed("ui_accept"):
				state = states.moving_to_position_1
		states.moving_to_position_1:
			var difference_in_position = position_1 - position
			difference_in_position = difference_in_position.normalized()
			position += difference_in_position * delta * 4
			
			if position.distance_to(position_1) < 0.1:
				state = states.moving_to_position_2
			
		states.moving_to_position_2:
			var difference_in_position = position_2 - position
			difference_in_position = difference_in_position.normalized()
			position += difference_in_position * delta * 4
			
			if position.distance_to(position_2) < 0.1:
				state = states.moving_to_position_3
			
		states.moving_to_position_3:
			var difference_in_position = position_3 - position
			difference_in_position = difference_in_position.normalized()
			position += difference_in_position * delta * 4
			
			if position.distance_to(position_3) < 0.1:
				state = states.idle
