extends Node2D

var size = 1000000

func _ready():
	call_deferred("calc_int")

func calc_int():
	yield(get_tree(),"idle_frame")
	calc()

func calc():
	var array_test : Array = []
	
	for i in range(size):
		array_test.push_back(float(randi()%1000)+randf())
		
	var last : float = 2.5
	for i in array_test:
		i = i / last if last != 0 else last+1
		last = i 
	
	var array_vect : PoolVector2Array = []
	for x in range(0, array_test.size(), 2):
		array_vect.push_back(Vector2(array_test[x], array_test[x+1]))
	
	for x in array_vect:
		var dot = x.dot(Vector2(randi()+randf(), randi()+randf()))
		var angle = x.angle()
		var aspect = x.aspect()
		var ceil_ = x.ceil()
		var floor_ = x.floor()
		var length = x.length_squared()
		var norma = x.normalized()
		var posmod_ = x.posmod(randf())
		var tangent_ = x.tangent()
		var cross = x.cross(Vector2(randi()+randf(), randi()+randf()))
		var sin_ = sin(randf())
		var asin_ = asin(randf())
		var acos_ = acos(randf())
		var cos_ = cos(randf())
		var atan_ = atan(randf())
		var tan_ = tan(randf())
		var tan_2 = atan2 (randf(), randf())
		var sin_h = sinh(randf())
		var sqrt_ = sqrt(pow(randi()%5000, randi()%5)+pow(randi()%5000, randi()%5)+pow(randi()%5000, randi()%5))
		
		
	global.next_bench()
