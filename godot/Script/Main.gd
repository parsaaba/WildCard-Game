extends Node2D
export (String) var server_url = ""
export (String) var app_id = ""

var moralis = JavaScript.get_interface("Moralis")
var myNFT = []
var loadingNFT = true

func _ready():
	$UI/Address/Label.text = moralis.User.current().get("ethAddress").substr(0,6)+".."
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	$HTTPRequest.request("http://178.128.126.146/api/myNFTonlyId?address="+moralis.User.current().get("ethAddress"))

func _on_Exit_pressed():
	get_tree().change_scene("res://Screen/Login.tscn")

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	myNFT = (json.result)
	myNFT += [4,5,1,2,3,4,5]
	loadingNFT = false
	$LoadingNFT.queue_free()

func showUI():
	get_tree(). reload_current_scene()
