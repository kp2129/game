extends Control

var username = ""
var password

var created = false

func _on_back_2_pressed():
	# Ensure input processing is reset
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)  
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  
	
	# Ensure the game tree is not paused
	get_tree().paused = false

	# Change the scene to the main menu
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func _on_login_pressed():
	get_tree().change_scene_to_file("res://scenes/login.tscn")

func _on_login_button_down():
	if !created:
		username = $Username.text
		password = $Password.text.sha256_text()
		created = true 
		print("Account created successfully!")
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		

func _on_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
	print(result)
	print(response_code)
	if response_code == 201:
		get_tree().change_scene_to_file("res://scenes/login.tscn")


