extends Node

var register_bench = [
	{
		"name":"GDScript Calculation",
		"frames_time": [],
		"scene": "res://Benchmarks/GDScript_Calculation/Main.tscn"
	},
	{
		"name":"2D Sprites",
		"frames_time": [],
		"scene": "res://Benchmarks/2D_Sprites_Rand/Main.tscn"
	},
	{
		"name":"3D Sprites",
		"frames_time": [],
		"scene": "res://Benchmarks/3D_Sprites_Rand/Main.tscn"
	}
]

var current_bench_index = 0
var bench_have_been_runned_one_time : bool = false

var r : RandomNumberGenerator

## BENCH CONTROL

func _init():
	r = RandomNumberGenerator.new()
	r.set_seed(50)

func start_bench():
	r = RandomNumberGenerator.new()
	r.set_seed(50)
	bench_have_been_runned_one_time = true
	current_bench_index = 0
	get_tree().change_scene(register_bench[current_bench_index].scene)

func next_bench():
	r = RandomNumberGenerator.new()
	r.set_seed(50)
	current_bench_index+= 1
	if current_bench_index != register_bench.size():
		get_tree().change_scene(register_bench[current_bench_index].scene)
	else:
		finished_bench()

func finished_bench():
	get_tree().change_scene("res://Menu_Result.tscn")
	pass

## FRAME CONTROL
func save_frame(frame):
	if current_bench_index != register_bench.size():
		register_bench[current_bench_index]["frames_time"].push_back(frame)

