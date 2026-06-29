class_name PlayerLocomotionState
extends PlayerState

func physics_process(delta: float) -> void:
    var input_vector := Input.get_vector("move_left", "move_right", "move_backward", "move_forward")
    var direction := (character.transform.basis * Vector3(input_vector.x, 0, input_vector.y)).normalized()
    # var velocity := direction * character.speed