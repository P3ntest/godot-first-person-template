@icon ("res://addons/at-icons/node/footsteps.svg")
class_name PlayerStepCycle
extends Node

signal footstep()
signal walk_cycle(progress: float, strength: float)

@onready var character: CharacterBody3D = get_parent()

@export var cycle_length: float = 2.0
@export var dead_zone: float = 0.1
@export var reset_time: float = 0.5

var _step_progress: float = 0.0
var _strength: float = 0.0
var _intermediate_step: bool = false

func _process(delta: float) -> void:
    var horizontal_velocity := Utils.hor(character.get_real_velocity())

    if horizontal_velocity.length() > dead_zone and character.is_on_floor():
        _strength = 1.0
    else:
        _strength = move_toward(_strength, 0.0, delta / reset_time)
        if _strength == 0.0:
            _step_progress = 0.0
            _intermediate_step = false

    var horizontal_delta := horizontal_velocity * delta

    var movement_delta := horizontal_delta.length()
    var cycle_progress := movement_delta / cycle_length

    _step_progress += cycle_progress

    if _step_progress > 0.5 and not _intermediate_step:
        _intermediate_step = true
        footstep.emit()

    if _step_progress > 1.0:
        _step_progress -= 1.0
        _intermediate_step = false
        footstep.emit()

    walk_cycle.emit(_step_progress, _strength)
