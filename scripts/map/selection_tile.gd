extends Panel

@export var map_tile_data: MapTileData;

@onready var tile_texture: TextureButton = $MarginContainer/TileTexture

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tile_texture.texture_normal = map_tile_data.background_texture;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
