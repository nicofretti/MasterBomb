extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var cell_positions = .get_used_cells()
	for pos in cell_positions:
		var tile_id = .get_cellv(pos)
		var tile_name = .get_tileset().tile_get_name(tile_id)
		if tile_name == "Candela":
			var l = Light2D.new()
			l.texture= load("res://TileSet/Bomarolo/CandelaLuceAnimation.tres")
			var correct = Vector2(30,0)
			print(.map_to_world(pos)+correct)
			l.position = .map_to_world(pos)+correct
			.add_child(l)
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
