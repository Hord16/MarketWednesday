extends Node2D

@onready var npc = preload("res://NPCIdle.tscn")
@onready var dressup = preload("res://NPCHelped.tscn")

func _ready():
	print ("Main lvl 1 online")
	var npc_scene = npc.instantiate()
	var dressup_scene = dressup.instantiate()
	npc_scene.position = Vector2(750,250)
	
	add_child(npc_scene)
	add_child(dressup_scene)
	
