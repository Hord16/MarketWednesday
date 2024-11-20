extends Node
@onready var desire_label = $DesireLabel
var desire: String = "" 

var Styles: Array[String] =["Y2K ", "Vintage ", "Streetwear ", "Chic ","Party ", "Sporty ", "Cozy ", "Formal "]
var Vibe: Array[String] = ["Bold ","Sci-fi ","Business Casual ","Night Clubbing ","Country Clubbing ","City ","Funny ","Spring ","Winter ","Tailgating ","Rock-STAR ", "All-STAR "]
var color: Array[String] = ["Red ","Orange ","Yellow ","Green ","Blue ","Indigo ","Violet "]
var Item: Array[String] = ["Hat ","Tee ","Pants ","Shorts ","Shoes ","Jacket ","Accessories "]

func _ready():
	print("helped")
	Signals.npcclick.connect(helped)

func helped():
	$Sprite2D.show()
	$Inventory.show()
	$EvalButton.show()
	$Xbutton.show()
	$DesireLabel.show()
	desire = DesireGeneration()
	display_desire()
	Signals.statechange.emit()
	
func display_desire():
	if desire == "":
		desire = "I'm not quite sure what I want"  # Default message
	desire_label.text = desire

##Desire Code
# Function to generate a desire
func DesireGeneration() -> String:
	var components: Array = []

	var new_style = NPCStyleGenerator()
	if new_style != "":
		components.append(new_style)

	var new_color = NPCColorGenerator()
	if new_color != "":
		components.append(new_color)

	var new_vibe = NPCVibeGenerator()
	if new_vibe != "":
		components.append(new_vibe)

	var new_item = NPCItemGenerator()
	if new_item != "":
		components.append(new_item)

		# Concatenate components to form the full desire string
	desire = ""
	for component in components:
		desire += component  
	# Concatenate each component to the desire string
	# If no components were added, set the desire to the default message
	if components.size() == 0:
		desire = "I'm not quite sure what I want"
	
	return desire

# Helper functions for random desire generation
func NPCStyleGenerator():
	var new_desire_style = Styles[randi() % Styles.size()]
	var style_roll = randf_range(0.0,1.0)
	if style_roll <=.7:
		return new_desire_style
	else:
		return ""
	
func NPCVibeGenerator():
	var new_desire_Vibe = Vibe[randi() % Vibe.size()]
	var Vibe_roll = randf_range(0.0,1.0)
	if Vibe_roll <=.5:
		return new_desire_Vibe
	else:
		return ""
		
func NPCItemGenerator():
	var new_desire_item = Item[randi() % Item.size()]
	var item_roll = randf_range(0.0,1.0)
	if item_roll <=.4:
		return new_desire_item
	else:
		return ""
		
func NPCColorGenerator():
	var new_desire_color = color[randi() % color.size()]
	var style_roll = randf_range(0.0,1.0)
	if style_roll <=.27:
		return new_desire_color
	else:
		return ""

func _on_eval_button_pressed() -> void:
	print("WOOOOOOOO")
