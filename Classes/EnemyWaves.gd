extends Resource

class_name EnemyWaves

@export var waves: Array[EnemyWave]


func get_wave_for_wave_count(wc: int) -> EnemyWave:
	# 5%5=0 6%5=1 7%5=2 ...
	return waves[wc % waves.size()]
	

func wave_is_start(wc: int) -> bool:
	return wc % waves.size() == 0
