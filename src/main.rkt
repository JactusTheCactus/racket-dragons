#lang racket/gui
(define (random-el list)
	(list-ref list (random (length list)))
)
(define (create-dragon texture colour)
	(define dragon (make-hash))
	(hash-set! dragon 'texture texture)
	(hash-set! dragon 'colour colour)
	dragon
)
(define dragons (list))
(define textures (list
	'Scales
	'Feathers
))
(define colours (list
	'Red
	'Orange
	'Yellow
	'Green
	'Blue
	'Purple
	'Pink
	'Brown
	'White
	'Grey
	'Black
	'Gold
	'Silver
	'Bronze
))
(define title "Dragons!")
(define main (new frame%
	[label title]
))
(define button (new button%
	[parent main]
	[label "Create new dragon"]
	[callback (lambda (button event)
		(define dragon (create-dragon
			(random-el textures)
			(random-el colours)
		))
		(set! dragons (reverse (cons dragon (reverse dragons))))
		(new button%
			[parent main]
			[label (string-append
				"Show Dragon#"
				(number->string (length dragons))
			)]
			[callback (lambda (button event)
				; (new frame%)
				(message-box
					(string-append
						"Dragon#"
						(number->string (length dragons))
					)
					(string-join (list
						(symbol->string (hash-ref dragon 'texture))
						(symbol->string (hash-ref dragon 'colour))
					) "\n")
				)
			)]
		)
	)]
))
(send main show #t)
