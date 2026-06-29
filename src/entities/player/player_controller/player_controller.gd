class_name PlayerController
extends Node

@export var character: CharacterBody3D
@export var camera_controller: PlayerCameraController
@export var initial_state: PlayerState

var _current_state: PlayerState

func _register_state(state: PlayerState) -> void:
	state.character = character
	state.camera = camera_controller

	state.request_transition.connect(_request_transition)

func _ready() -> void:
	# Register all PlayerState nodes as states
	for state in get_children():
		if state is PlayerState:
			_register_state(state)

	# Enter the initial state
	if initial_state:
		_enter_state(initial_state)
	else:
		push_error("No initial state set for PlayerController.")

## Finds a PlayerState by name
func _get_state(state_name: String) -> PlayerState:
	var state = get_node_or_null(state_name)
	if state:
		if state is PlayerState:
			return state
		else:
			push_error("Node '%s' is not a PlayerState." % state_name)
			return null
	push_error("PlayerState '%s' not found." % state_name)
	return null

func _request_transition(new_state_name: String) -> void:
	var new_state = _get_state(new_state_name)
	if new_state:
		_enter_state(new_state)

func _exit_current_state() -> void:
	if _current_state:
		_current_state.exit()
		_current_state = null

func _enter_state(new_state: PlayerState) -> void:
	_exit_current_state()
	_current_state = new_state
	_current_state.enter()

func _physics_process(delta: float) -> void:
	if _current_state:
		_current_state.physics_process(delta)

func _process(delta: float) -> void:
	if _current_state:
		_current_state.process(delta)