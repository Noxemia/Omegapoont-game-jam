extends Node
const PORT = Constants.PORT


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var argsSystem = OS.get_cmdline_args()
	var isServer = argsSystem[2] == "isServer"
	if (!isServer):
		return
	multiplayer.peer_connected.connect(_on_player_connected)
	multiplayer.peer_disconnected.connect(_on_player_disconnected)
	multiplayer.connected_to_server.connect(_on_connected_ok)
	multiplayer.connection_failed.connect(_on_connected_fail)
	multiplayer.server_disconnected.connect(_on_server_disconnected)
	_create_server()
	await get_tree().create_timer(5.0).timeout
	test_message.rpc()


func _on_player_connected(id):
	print("player connected with id "+str(id)+" to "+str(multiplayer.get_unique_id()))
	#await get_tree().create_timer(5.0).timeout
	#test_message.rpc_id(id)

func _on_player_disconnected():
	print("player disconnect")
	
func _on_connected_ok():
	print("Connected ok")
	
func _on_connected_fail():
	print("connected fail")
	multiplayer.multiplayer_peer = null
	
func _on_server_disconnected():
	print("Server disconnect")

func _create_server():
	var peer = WebSocketMultiplayerPeer.new()
	var error
	#if Constants.USE_SSL:
		#var priv := load(Constants.PRIVATE_KEY_PATH)
		#var cert := load(Constants.TRUSTED_CHAIN_PATH)
		#var tlsOptions = TLSOptions.server(priv, cert)
		#error = peer.create_server(PORT, "*", tlsOptions)
	#else:
	error = peer.create_server(PORT, Constants.SERVER_IP)
	print("Created server on: " + Constants.SERVER_IP)
	#if error:
		#return error
	multiplayer.multiplayer_peer = peer

@rpc("any_peer", "call_remote", "reliable")
func test_message():
	print("Message Recieved")
	
