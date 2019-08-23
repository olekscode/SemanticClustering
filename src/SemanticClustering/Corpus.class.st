Class {
	#name : #Corpus,
	#superclass : #OrderedCollection,
	#category : #SemanticClustering
}

{ #category : #'instance creation' }
Corpus class >> fromClasses: aCollectionOfClasses [ 
	^ self newFrom: (CorpusBuilder new collectTokensFromClasses: aCollectionOfClasses)
]

{ #category : #'instance creation' }
Corpus class >> fromMethods: aCollectionOfMethods [ 
	^ self newFrom: (CorpusBuilder new collectTokensFromMethods: aCollectionOfMethods)
]

{ #category : #'instance creation' }
Corpus class >> fromPackages: aCollectionOfPackages [ 
	^ self newFrom: (CorpusBuilder new collectTokensFromPackages: aCollectionOfPackages)
]

{ #category : #'instance creation' }
Corpus class >> fromProjects: aCollectionOfProjectPrefixes [ 
	^ self newFrom: (CorpusBuilder new collectTokensFromProjects: aCollectionOfProjectPrefixes)
]

{ #category : #files }
Corpus >> saveToFile: aFileReference [
	| stream |
	stream := aFileReference writeStream.

	self do: [ :each |
		stream nextPutAll: (' ' join: each); cr. ].
]
