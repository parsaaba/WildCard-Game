extends Control

var HP = 30;
onready var HPProgress = get_node("HealthProgress")
onready var StartGame = get_parent().get_parent().get_node(".")
onready var HPMy = get_parent().get_parent().get_node("MyUI/Health")
onready var HPMyProgress = get_parent().get_parent().get_node("MyUI/Health/HealthProgress")
onready var CameraMain =  get_node("/root/Main/Camera2D")
onready var MainGame =  get_node("/root/Main/MainGame")

signal changeMyCountBar(value)
signal changeEnemyCountBar(value)

signal checkDrawNft()
signal endTurnMana()
var EndGame = false

func _process(delta):
	$Label.text = String(HP)
	HPProgress.value = HP
	if(HP <= 0 && EndGame == false):
		EndGame == true
		MainGame.endGame("YOU WIN")


func _on_StartGame_enemyCountChangeSignal(count):
	print("Enemy Count : %s " % count)
	if(count > 12):
		var calHP = count - 12
		HP -= calHP
		print(HP)
		HPProgress.value = HP
		StartGame.myCount = 0
		StartGame.enemyCount = 0
		StartGame.lock = false
		StartGame.enemyLock = false
		emit_signal("changeMyCountBar",0)
		emit_signal("changeEnemyCountBar",0)
		emit_signal("checkDrawNft")
		emit_signal("endTurnMana")
	elif(count == 12):
		var calHP = 12 - StartGame.myCount
		HPMy.HP -= calHP
		HPMyProgress.value = HPMy.HP
		CameraMain.isShake = true
		StartGame.myCount = 0
		StartGame.enemyCount = 0
		StartGame.lock = false
		StartGame.enemyLock = false
		emit_signal("changeMyCountBar",0)
		emit_signal("changeEnemyCountBar",0)
		emit_signal("checkDrawNft")
		emit_signal("endTurnMana")
	elif(StartGame.lock == true && StartGame.enemyLock == true):
		if(StartGame.enemyCount > StartGame.myCount):
			var calHP = StartGame.enemyCount - StartGame.myCount
			HPMy.HP -= calHP
			CameraMain.isShake = true
			HPMyProgress.value = HPMy.HP
		elif(StartGame.enemyCount < StartGame.myCount):
			var calHP = StartGame.myCount - StartGame.enemyCount
			HP -= calHP
			HPProgress.value = HP
		StartGame.myCount = 0
		StartGame.enemyCount = 0
		StartGame.lock = false
		StartGame.enemyLock = false
		emit_signal("changeMyCountBar",0)
		emit_signal("changeEnemyCountBar",0)
		emit_signal("checkDrawNft")
		emit_signal("endTurnMana")
		
