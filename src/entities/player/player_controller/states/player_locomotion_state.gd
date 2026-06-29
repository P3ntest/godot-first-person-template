class_name PlayerLocomotionState
extends PlayerState

signal jumped()

@export var walk_speed: float = 3.0
@export var jump_velocity: float = 3.0
@export var gravity: float = 9.8
@export var fall_multiplier: float = 2.0
@export var ground_acceleration: float = 10.0

func physics_process(delta: float) -> void:
    var input_vector := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
    var direction := (character.transform.basis * Vector3(input_vector.x, 0, input_vector.y)).normalized()

    var wish_velocity := direction * walk_speed

    var original_vertical_velocity := character.velocity.y
    character.velocity.y = 0  # Ignore vertical velocity for horizontal movement
    character.velocity = character.velocity.move_toward(wish_velocity, ground_acceleration * delta)
    character.velocity.y = original_vertical_velocity  # Restore vertical velocity

    if Input.is_action_just_pressed("jump"):
        character.velocity.y = jump_velocity
        jumped.emit()
    else:
        var fall_accel := gravity
        if character.velocity.y < 0.0:
            fall_accel *= 2.0  # Apply stronger gravity when falling
        character.velocity.y -= fall_accel * delta

    character.move_and_slide()