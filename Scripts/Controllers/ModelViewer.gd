extends Spatial

onready var models := [ 
	preload("res://Models/Taxi.tscn"), 
	preload("res://Models/Race.tscn"),
	preload("res://Models/TractorPolice.tscn"),
	preload("res://Models/Barrel.tscn"),
	preload("res://Models/Tree.tscn"),
	preload("res://Models/Crate.tscn"),
]
onready var model_name := get_parent().get_node("UI/Name")
var model_index := 0
var current_model = null


func _ready() -> void:
	_setModel(model_index)
	pass


func nextModel() -> void:
	if model_index >= models.size()-1:
		model_index = 0
	else:
		model_index += 1
	_setModel(model_index)
	pass


func prevModel() -> void:
	if model_index <= 0:
		model_index = models.size()-1
	else:
		model_index -= 1
	_setModel(model_index)
	pass


func _setModel(index: int) -> void:
	var model = models[index].instance()
	if current_model != null:
		current_model.queue_free()
	add_child(model)
	current_model = model
	model_name.text = current_model.mesh.resource_path.get_file()
	pass
