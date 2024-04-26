extends Node

@onready var class_scene: ConceptClassScene = $ParseAndPlay
@onready var window: ConceptClassWindow = $ClassWindow

func _ready():
    DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
    print("ClassScene._ready")
    window.find_group_by_timestamp = class_scene.find_group_by_timestamp
    _setup_scene()

func _setup_scene():
    window.set_class_node(class_scene)
    window.set_section_tree(class_scene.section_manager.tree)
    class_scene.compute_duration()
    window.set_total_time(ceili(class_scene.total_duration))
    window.stopwatch.start()
    class_scene.play()