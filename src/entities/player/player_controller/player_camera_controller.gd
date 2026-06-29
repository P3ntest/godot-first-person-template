@icon ("res://addons/at-icons/node/photo_camera.svg")
class_name PlayerCameraController
extends Node

@export var sensitivity: float = 1

## The head to rotate up and down
@export var head: Node3D
@onready var character: CharacterBody3D = get_parent()

func _ready() -> void:
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

## Called when the player controller enters a normal state
func first_person() -> void:
    pass

func _sens() -> float:
    # convert from degrees to radians and apply sensitivity
    return deg_to_rad(sensitivity)

func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        var mouse_event := event as InputEventMouseMotion
        
        character.rotate_y(-mouse_event.screen_relative.x * _sens())
        head.rotation.x = clamp(head.rotation.x - mouse_event.screen_relative.y * _sens(), deg_to_rad(-90), deg_to_rad(90))