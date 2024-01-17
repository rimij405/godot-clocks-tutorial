extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update()


# Update the clockface time.
func update():
	var datetime_local := Time.get_time_dict_from_system()
	set_hour(datetime_local)
	set_minute(datetime_local)
	set_second(datetime_local)
	

# Get the total number of seconds based on the current time.
func total_seconds(time: Dictionary) -> float:
	return float(
		time.second +
		(time.minute * 60.0) +
		(time.hour * 3600)
	)


# Set the hour hand position.
func set_hour(time: Dictionary) -> void:
	var delta := TAU / 12.0
	var seconds := total_seconds(time)
	var x := fmod(seconds / 3600.0, 12.0)
	$ArmHour.rotation = x * delta


# Set the minute hand position.
func set_minute(time: Dictionary) -> void:
	var delta := TAU / 60.0
	var seconds := total_seconds(time)
	var x := fmod(seconds / 60.0, 60.0)
	$ArmMinute.rotation = x * delta


# Set the second hand position.
func set_second(time: Dictionary) -> void:
	var delta := TAU / 60.0
	var seconds := total_seconds(time)
	var x := fmod(seconds, 60.0)
	$ArmSecond.rotation = x * delta
