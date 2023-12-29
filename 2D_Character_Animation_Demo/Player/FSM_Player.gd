extends Node

enum STATES {IDLE, MOVE}

var state: int = 0

onready var parent = get_parent()


func _physics_process(delta):
	run_state(delta)


func run_state(delta):
	parent._player_input()
	parent.aim(parent.get_global_mouse_position())
	
	match state:
		STATES.IDLE:
			parent._idle()
			
			if (parent.x_input != 0):
				_set_state(STATES.MOVE)
		STATES.MOVE:
			parent._animate_legs()
			parent._move(delta, parent.x_input)
			
			if (parent.x_input == 0):
				_set_state(STATES.IDLE)


func _set_state(new_state: int):
	if (state == new_state):
		return
	
	state = new_state
