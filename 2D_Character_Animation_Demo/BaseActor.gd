extends KinematicBody2D
class_name Actor
# Actor class
# Inherited by entities such as the player and enemies. This would contain the functions for health and damage,
# however since this is just a demo project for player character animation, it is unnecessary.

export var MAX_SPEED     : int = 18
export var ACCELERATION  : int = 100
export var FRICTION      : float = 1.0
export var base_hp: int = 0

var motion: Vector2 = Vector2.ZERO

onready var hp: int = base_hp


func _idle():
	motion.x = lerp(motion.x, 0, FRICTION)


func _move(delta, direction):
	motion.x += direction * ACCELERATION * delta
	motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
	motion = move_and_slide(motion, Vector2.UP)


func apply_physics():
	motion = move_and_slide(motion, Vector2.UP)
