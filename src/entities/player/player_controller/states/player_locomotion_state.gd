class_name PlayerLocomotionState
extends PlayerState

@export var walk_speed: float = 5.0
@export var ground_acceleration: float = 10.0

func physics_process(delta: float) -> void:
    var input_vector := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
    var direction := (character.transform.basis * Vector3(input_vector.x, 0, input_vector.y)).normalized()

    var wish_velocity := direction * walk_speed

    var original_vertical_velocity := character.velocity.y
    character.velocity.y = 0  # Ignore vertical velocity for horizontal movement
    character.velocity = character.velocity.move_toward(wish_velocity, ground_acceleration * delta)
    character.velocity.y = original_vertical_velocity  # Restore vertical velocity

    character.move_and_slide()