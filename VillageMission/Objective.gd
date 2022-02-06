extends Control

onready var candle = get_parent().get_parent().get_node("Candle")

func _ready():
	$Label.text = """Objective :
		Find 6 candles"""
