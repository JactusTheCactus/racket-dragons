#lang racket/gui
(define main
	(new frame%
		[label "My Racket GUI App"]
	)
)
(define button
	(new button%
		[parent main]
		[label "Click Me!"]
		[callback (lambda
			(button event)
			(message-box
				"Hello"
				"You clicked the button!"
			)
		)]
	)
)
(send main show #t)
