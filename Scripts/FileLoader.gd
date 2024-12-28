extends Control


var file_path := ""
var obj_folder := "res://Models/OBJ/"
var loaded_file := File.new()

onready var viewer := $"%ModelViewer"


func _ready() -> void:
	get_tree().connect("files_dropped", self, "get_files_path")


func get_files_path(files: PoolStringArray, _screen: int) -> void:
	file_path = files[0]
	create_new_model()


func create_new_model() -> void:
	var dir := Directory.new()
	#var model := MeshInstance.new()

	# Copy OBJ model
	dir.copy(file_path, obj_folder+file_path.get_file())

	# Copy MTL file
	dir.copy(get_mtl_path(), 
	obj_folder+get_mtl_path().get_file())

	# Copy PNG texture
	var copy_path : String = get_tex_path(obj_folder+get_mtl_path().get_file())[0]
	var rel_path : String = get_tex_path(obj_folder+get_mtl_path().get_file())[1]

	# Check if MTL file exist, if yes, get the texture
	if dir.file_exists(obj_folder+get_mtl_path().get_file()):
		# Check if directory exists first before copying file
		if dir.dir_exists(obj_folder+rel_path) == true:
			dir.copy(copy_path, obj_folder+rel_path)
		else:
			dir.make_dir(obj_folder+rel_path.get_base_dir())
			dir.copy(copy_path, obj_folder+rel_path)

	# Check if import file exists first, if yes, load the mesh
	# Make a PackedScene and push it on models
	if dir.file_exists(obj_folder+get_mtl_path().get_file()+".import") == true:
		#model.mesh = load(obj_folder+file_path.get_file())
		#add_child(model)
		pass
	viewer.add_model(obj_folder+file_path.get_file(), obj_folder+file_path.get_file().replacen(".obj", ".tscn"))


func get_mtl_path() -> String:
	var mtl_path := ""
	var file := File.new()

	# Open OBJ, get its text, then find MTL's path
	file.open(file_path, File.READ)
	var obj_contents := file.get_as_text()

	# Find mtllib and .mtl, then get their length
	var mtl_path_start := obj_contents.findn("mtllib ")+7
	var mtl_path_end := obj_contents.findn(".mtl", 0)+4

	# Remove all string from left starting at mtllib string's length
	mtl_path = obj_contents.trim_prefix(obj_contents.left(mtl_path_start))

	# Remove all string from right starting at .mtl string's length
	mtl_path = mtl_path.trim_suffix(obj_contents.right(mtl_path_end))

	file.close()

	# Check if file path is valid and relative to the OBJ's path
	if mtl_path.is_rel_path() == true:
		mtl_path = mtl_path.insert(0, file_path.get_base_dir()+"/")

	return mtl_path


func get_tex_path(mtl_path: String) -> Array:
	var tex_path := ""
	var paths := ["", ""]
	var file := File.new()

	# Open MTL, get its text, then find PNG's path
	file.open(mtl_path, File.READ)
	var mtl_contents := file.get_as_text()

	# Find map_Kd and .mtl, then get their length
	var tex_path_start := mtl_contents.findn("map_kd ")+7
	var tex_path_end := mtl_contents.findn(".png", 0)+4

	# Remove all string from left starting at mtllib string's length
	tex_path = mtl_contents.trim_prefix(mtl_contents.left(tex_path_start))

	# Remove all string from right starting at .mtl string's length
	tex_path = tex_path.trim_suffix(mtl_contents.right(tex_path_end))

	# Relative path of file being copied
	paths[1] = tex_path

	file.close()

	# Get absolute path of texture
	var file_origin := file_path.get_basename()
	var file_name := file_path.get_file()

	file_name = file_name.trim_suffix("."+file_name.get_extension())
	file_origin = file_origin.trim_suffix(file_name)

	tex_path = tex_path.insert(0, file_origin)

	# 'Copy to' path
	paths[0] = tex_path

	return paths
