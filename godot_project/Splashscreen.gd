extends Spatial

signal splash_screen_finished

var head_node = null

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var last_extreme_angle = 0
var last_angle = 0
var dir = 1

var min_nod_rot = PI/6.0

var nod_count = 0
var last_down_count = 0
var nod_target = 5

func _process(delta):
	var r = head_node.rotation.x
	var ts = OS.get_ticks_msec()
	if abs(ts-last_down_count) > 3000:
		nod_count = max(nod_count-2, 0)
		last_down_count = ts
	#print ("%d %f  %f  %f  %d %d"%[nod_count, r,dir,r-last_angle,sign(dir),sign(r-last_angle)])
	if sign(r-last_angle) != 0 and sign(dir) != sign(r-last_angle):
		if abs(last_extreme_angle-last_angle) > min_nod_rot:
			print("Nod %d"%nod_count)
			nod_count = nod_count +1
		if nod_count >= nod_target:
			emit_signal("splash_screen_finished")
		last_extreme_angle = last_angle
	if sign(r-last_angle) != 0:
		dir = sign(r-last_angle)
	last_angle = r
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
