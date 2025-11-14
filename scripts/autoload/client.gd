extends Node
const DEFAULT_SERVER_IP = Constants.SERVER_IP
const PORT = Constants.PORT


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	join_game("")


func join_game(address = ""):
	if address.is_empty():
		address = DEFAULT_SERVER_IP
	multiplayer.multiplayer_peer = null
	var peer = WebSocketMultiplayerPeer.new()
	var error
	if Constants.USE_SSL:
		#var cert := load(Constants.TRUSTED_CHAIN_PATH)
		#var tlsOptions = TLSOptions.client(cert)
		#error = peer.create_client("wss://" + address + ":" + str(PORT), tlsOptions)
		pass
	else:
		error = peer.create_client("ws://" + address + ":" + str(PORT))
		print("Created client on:" + address)
	if error:
		return error
	multiplayer.multiplayer_peer = peer
