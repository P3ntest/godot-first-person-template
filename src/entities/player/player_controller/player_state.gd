@icon ("res://addons/at-icons/node/circle.svg")
@abstract
class_name PlayerState
extends Node

var character: CharacterBody3D
var camera: PlayerCameraController

signal request_transition(new_state: String)

func enter() -> void:
    pass

func exit() -> void:
    pass

## The player state physics_process, only called when this state is active
func physics_process(_delta: float) -> void:
    pass

## The player state process, only called when this state is active
func process(_delta: float) -> void:
    pass