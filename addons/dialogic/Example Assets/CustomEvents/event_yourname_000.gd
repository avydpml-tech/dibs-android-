extends Node


func handle_event(event_data, dialog_node):
	""" 
		If this event should wait for dialog advance to occur, uncomment the WAITING line
		If this event should block the dialog from continuing, uncomment the WAITINT_INPUT line
		While other states exist, they generally are not neccesary, but include IDLE, TYPING, and ANIMATING
	"""
	
	
	
	pass
	
	
	dialog_node._load_next_event()
	dialog_node.set_state(dialog_node.state.READY)
