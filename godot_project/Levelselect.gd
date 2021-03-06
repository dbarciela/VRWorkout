extends Spatial

signal level_selected(filename, difficulty, level_number)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func get_song_list(path):
	var song_list = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	var fname = dir.get_next()
	while fname != "":
		if not dir.current_is_dir():
			var fields = fname.split(".")
			print (str(fields))
			if fields and fields[-1] == "ogg":
				var full_path = "%s/%s"%[dir.get_current_dir(),fname]
				song_list.append(full_path)
		fname = dir.get_next()

	return song_list
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print ("Local addresses: %s"%str(IP.get_local_addresses()))
	
	var songs = ["res://audio/songs/vrworkout.ogg",
			"res://audio/songs/cdk_deeper_in_yourself.ogg",
			"res://audio/songs/cdk_like_this.ogg",
			"res://audio/songs/cdk_the_game_has_changed.ogg",
			"res://audio/songs/ffact_shameless_site_promotion.ogg",
			"res://audio/songs/scomber_clarity.ogg",
			"res://audio/songs/vrworkout_beater.ogg",
			"res://audio/nonfree_songs/Slayers_of_the_Ice_Dragon.ogg"]
	
	#get_song_list("res://audio/songs")
	#songs += get_song_list("res://audio/nonfree_songs")
	
	
	
	print (str(songs))
	get_node("SongSelector").set_songs(songs)
	
	get_node("MainText").print_info("VRWorkout\nSelect song by touching a block\nBest played hands only - no controllers\nPosition yourself between the blue poles\nRun in place to get multipliers\n\nTurn around for a tutorial")
	
	get_node("Tutorial").print_info("How to play\n- Hit the hand cues to the beat of the music\n- Head cues should only be touched no headbutts\n- Run in place to receive point multipliers!\nThe optimal time to hit the cues is when the\nrotating marker meets the static one")	
	
	get_node("BeastModeSelector").beast_mode = ProjectSettings.get("game/beast_mode")
	get_node("BeastModeSelector").update_switch()
	
	get_node("JumpSwitch").value = ProjectSettings.get("game/exercise/jump")
	get_node("JumpSwitch").update_switch()
	
	get_node("StandSwitch").value = ProjectSettings.get("game/exercise/stand")
	get_node("StandSwitch").update_switch()
	
	get_node("SquatSwitch").value = ProjectSettings.get("game/exercise/squat")
	get_node("SquatSwitch").update_switch()
	
	get_node("PushupSwitch").value = ProjectSettings.get("game/exercise/pushup")
	get_node("PushupSwitch").update_switch()

	get_node("CrunchSwitch").value = ProjectSettings.get("game/exercise/crunch")
	get_node("CrunchSwitch").update_switch()

	get_node("BurpeeSwitch").value = ProjectSettings.get("game/exercise/burpees")
	get_node("BurpeeSwitch").update_switch()

	get_node("DuckSwitch").value = ProjectSettings.get("game/exercise/duck")
	get_node("DuckSwitch").update_switch()

	get_node("SprintSwitch").value = ProjectSettings.get("game/exercise/sprint")
	get_node("SprintSwitch").update_switch()

	get_node("KneesaverSwitch").value = ProjectSettings.get("game/exercise/kneesaver")
	get_node("KneesaverSwitch").update_switch()


func set_main_text(text):
	get_node("MainText").print_info(text)

func get_last_beat():
	return get_node("BPM").last_beat



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_JumpSwitch_toggled(value):
	ProjectSettings.set("game/exercise/jump", value)
	
func _on_StandSwitch_toggled(value):
	ProjectSettings.set("game/exercise/stand", value)


func _on_CrunchSwitch_toggled(value):
	ProjectSettings.set("game/exercise/crunch", value)


func _on_SquatSwitch_toggled(value):
	ProjectSettings.set("game/exercise/squat", value)


func _on_PushupSwitch_toggled(value):
	ProjectSettings.set("game/exercise/pushup", value)


func _on_BurpeeSwitch_toggled(value):
	ProjectSettings.set("game/exercise/burpees", value)


func _on_DuckSwitch_toggled(value):
	ProjectSettings.set("game/exercise/duck", value)


func _on_SprintSwitch_toggled(value):
	ProjectSettings.set("game/exercise/sprint", value)

func _on_KneesaverSwitch_toggled(value):
	ProjectSettings.set("game/exercise/kneesaver", value)



func _on_SongSelector_level_selected(filename, difficulty, level_number):
	emit_signal("level_selected", filename, difficulty, level_number)
