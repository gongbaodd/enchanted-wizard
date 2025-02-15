extends Node

func destory():
	Global.collectedMonsterCount += 1
	queue_free()
