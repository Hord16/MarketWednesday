extends Area2D

func _ready() -> void:
	print("lets goooooo")
	Signals.statechange.connect(activenpc)
	Signals.IDLE.connect(idlestate)
	
func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		queue_free()
		Signals.npcclick.emit()

func activenpc():
	input_pickable = false

func idlestate():
	input_pickable = true
