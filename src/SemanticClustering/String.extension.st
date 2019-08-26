Extension { #name : #String }

{ #category : #'*SemanticClustering' }
String >> isAllLetters [
	"Returns whether the receiver is composed entirely of alphanumerics (i.e., letters or digits)."
	"'3.123' isAllLetters >>> false"
	"'a3123abc' isAllLetters >>> false"
	"'3123' isAllLetters >>> false"
	"'3,123' isAllLetters >>> false"
	"'hello' isAllLetters >>> true"
	
	self do: [:c | c isLetter ifFalse: [^ false]].
	^ true
]
