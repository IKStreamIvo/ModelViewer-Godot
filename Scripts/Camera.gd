extends Camera

onready var backgrounds := [
	preload("res://Assets/Resources/SimpleEnv.tres"),
	preload("res://Assets/Resources/GlowEnv.tres"),
] 


func _ready() -> void:
	environment = backgrounds[0]


func _on_Background_toggled(button_pressed: bool) -> void:
	environment = backgrounds[int(button_pressed)]
