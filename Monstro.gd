extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.3

func _ready():
	$Sprite.play("Walk")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 100
	

func _process(delta):
	
	if (flip):
		$".".position.x += velocidade
		$Sprite.flip_h = false
		if ($".".position.x >= posicao_final):
			flip = false
	if (!flip):
		$Sprite.flip_h = true
		$".".position.x -= velocidade
		if ($".".position.x <= posicao_inicial):
			flip = true
	

func dano():
	$Sprite.play("Dead")
	$Shape.queue_free()
	get_node("Anim").play("Dead")

func die():
	$".".queue_free()
