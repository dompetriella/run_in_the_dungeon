extends Control

@onready var map_root: Control = %MapRoot;
@onready var tile_selection_column: VBoxContainer = %TileSelectionColumn;

@export var map_tile_textures: Array[Texture] = [];
@export var selection_tile_number: int = 5;

var SELECTION_TILE: PackedScene = load("res://scenes/map/selection_tile.tscn");

func _ready() -> void:

	for i in selection_tile_number:	
		var new_selection_tile: Node = SELECTION_TILE.instantiate();
		var map_tile_data: MapTileData = MapTileData.new();
		map_tile_data.id = i;
		map_tile_data.background_texture = get_random_background_texture();
		new_selection_tile.map_tile_data = map_tile_data;
		tile_selection_column.add_child(new_selection_tile);
	

func get_random_background_texture() -> Texture:
	var random_texture: Texture = map_tile_textures.pick_random();
	var image: Image = random_texture.get_image();
	var rng = RandomNumberGenerator.new();
	rng.randomize();
	var rotation_times: int = rng.randi_range(1,3);
	for i in rotation_times:
		image.rotate_90(CLOCKWISE);
	var rotated_texture: Texture = ImageTexture.create_from_image(image);
	return rotated_texture;
