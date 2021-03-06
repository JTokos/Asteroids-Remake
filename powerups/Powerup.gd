extends "res://weightless/Weightless.gd"

onready var ui = get_tree().current_scene.get_node("UI")
var despawnTime = 8000 #in milliseconds, this is 8 seconds
var spawnTime

func _ready():
	set_max_contacts_reported(1)
	spawnTime = OS.get_ticks_msec()
	pass
	
func _process(delta):
	if (OS.get_ticks_msec() - spawnTime > despawnTime):
		queue_free()
	pass
	
func _integrate_forces(state):
	var contacts = state.get_contact_count()
	for i in range(contacts):	
		queue_free()
		sleeping = true
			
	._integrate_forces(state)
	pass