extends RigidBody3D

var planeInput = PlaneControl.new();

class PlaneControl:
	var yaw: float # -1.0 to 1.0
	var pitch: float # -1.0 to 1.0
	var roll: float # -1.0 to 1.0
	var throttle: float # 0.0 to 1.0
	
	func update():
		self.yaw = Input.get_action_strength("yaw-right") - Input.get_action_strength("yaw-left")
		self.pitch = Input.get_action_strength("pitch-down") - Input.get_action_strength("pitch-up")
		self.roll = Input.get_action_strength("roll-right") - Input.get_action_strength("roll-left")
		self.throttle = Input.get_action_strength("throttle-up") - Input.get_action_strength("throttle-down")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _integrate_forces(state):
	planeInput.update()
	state.apply_central_force(Vector3(0, 0, -10 * planeInput.throttle))
	state.apply_torque(Vector3(1, 0, 0) * planeInput.roll)
	print(planeInput.throttle)


