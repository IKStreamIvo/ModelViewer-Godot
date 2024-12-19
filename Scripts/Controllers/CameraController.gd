extends Spatial

onready var camera = get_node("Camera")
onready var rotate_speed = .5
onready var rotate_smoothing = 10
onready var rotate_limits = [-89, 89]
onready var zoom_speed = 5
onready var zoom_smoothing = 10
onready var zoom_limits = [30, 50]

var yaw = 90
var pitch = -15
var zoom = 50

var do_rotate


func _process(delta: float) -> void:
	var target_pitch = lerp(rotation_degrees.x, pitch, delta * rotate_smoothing)
	var target_yaw = lerp(rotation_degrees.y, yaw, delta * rotate_smoothing)
	var target_zoom = lerp(camera.fov, zoom, delta * zoom_smoothing)

	rotation_degrees = Vector3(target_pitch, target_yaw, 0)
	camera.fov = target_zoom
	pass


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			do_rotate = event.pressed
		if event.button_index == BUTTON_WHEEL_DOWN:
			zoom = clamp(zoom + zoom_speed, zoom_limits[0], zoom_limits[1])
		if event.button_index == BUTTON_WHEEL_UP:
			zoom = clamp(zoom - zoom_speed, zoom_limits[0], zoom_limits[1])

	if do_rotate:
		if event is InputEventMouseMotion:
			yaw -= event.relative.x * rotate_speed
			#pitch -= event.relative.y * rotateSpeed
			pitch = clamp(pitch - event.relative.y * rotate_speed, rotate_limits[0], rotate_limits[1])
	pass
