Extension { #name : #Collection }

{ #category : #'*SemanticClustering' }
Collection >> collect: aBlock displayingProgress: aStringOrBlock [
	"Enumerate aBlock and collect the result displaying progress information. 
 	 If the argument is a string, use a static label for the process. 
	 If the argument is a block, evaluate it with the element to retrieve the label."
	| newCollection |
	newCollection := self species new.
	self do: [:each | newCollection add: (aBlock value: each)] displayingProgress: aStringOrBlock.
	^ newCollection
	
]

{ #category : #'*SemanticClustering' }
Collection >> collect: aBlock displayingProgressWithCounter: aProgressBlock [
	"A helper method for enumeraning a collectin and collecting results displaying progress bar with a counter"
	| counter |
	counter := 1.
	
	^ self
		collect: [ :each |
			counter := counter + 1.
			aBlock value: each ]
		displayingProgress: [ :each |
			'(', counter asString, '/', self size asString, ') ', (aProgressBlock value: each) ]
	
]

{ #category : #'*SemanticClustering' }
Collection >> flatten [
	"Flatten a collection of collections into a collection of values"
	^ self flatCollect: #yourself.
]
