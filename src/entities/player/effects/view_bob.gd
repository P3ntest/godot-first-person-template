@icon ("res://addons/at-icons/node3d/arrow_double_vertical.svg")
class_name ViewBob
extends Node3D

@export var vertical_bob_strength: float = 0.05
@export var horizontal_bob_strength: float = 0.05

func update_bob(progress: float, strength: float) -> void:
    var vertical_offset := (cos(progress * PI * 4) - 1.0) * vertical_bob_strength * strength
    var horizontal_offset := sin(progress * PI * 2) * horizontal_bob_strength * strength

    position.y = vertical_offset
    position.x = horizontal_offset