extends Button


# Called when the node enters the scene tree for the first time.
func _pressed() -> void:
	Signals.IDLE.emit()
	print("IDLEEEE ")
	$"../Sprite2D".hide()
	$"../DesireLabel".hide()
	$"../Inventory".hide()
	$"../EvalButton".hide()
	self.hide()
