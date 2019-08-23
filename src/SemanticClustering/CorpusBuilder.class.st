Class {
	#name : #CorpusBuilder,
	#superclass : #Object,
	#category : #SemanticClustering
}

{ #category : #'instance creation' }
CorpusBuilder >> collectTokensFromClasses: aCollectionOfClasses [
	"Collects source code of each method from the given classes as a sequence of subtokens (tokens of source code split by camel case). Tokens of one class are flattened into a single sequence of tokens"
	
	^ aCollectionOfClasses asOrderedCollection
		collect: [ :aClass |
			(self collectTokensFromMethods: aClass methods) flatten ]
		displayingProgressWithCounter: [ :aClass | aClass name ].
	
]

{ #category : #'instance creation' }
CorpusBuilder >> collectTokensFromMethods: aCollectionOfMethods [
	"Collects source code of each method as a sequence of subtokens (tokens of source code split by camel case)"
	| tokenizer |
	tokenizer := PharoCodeTokenizer new.
	
	^ aCollectionOfMethods asOrderedCollection
		collect: [ :method |
			tokenizer tokenizeWithIdentifierNames: method ]
		displayingProgressWithCounter: [ :method | method selector ]
	
]

{ #category : #'instance creation' }
CorpusBuilder >> collectTokensFromPackages: aCollectionOfPackages [
	"Collects source code of each method from the given packages as a sequence of subtokens (tokens of source code split by camel case). Tokens of one package are flattened into a single sequence of tokens"
	
	^ aCollectionOfPackages asOrderedCollection
		collect: [ :package |
			(self collectTokensFromClasses: package classes) flatten ]
		displayingProgressWithCounter: [ :package | package name ].
	
]

{ #category : #'instance creation' }
CorpusBuilder >> collectTokensFromProjects: aCollectionOfProjectPrefixes [
	"Collects source code of each method from the given projects as a sequence of subtokens (tokens of source code split by camel case). Package names of one project should start with the same prefix. Tokens of one project are flattened into a single sequence of tokens"
	| packages |
	
	^ aCollectionOfProjectPrefixes asOrderedCollection
		collect: [ :projectPrefix |
			packages := Smalltalk image packages select: [ :package |
				package name beginsWith: projectPrefix ].
			(self collectTokensFromPackages: packages) flatten ]
		displayingProgressWithCounter: [ :projectPrefix | projectPrefix ].
	
]
