Class {
	#name : #CorpusCleaner,
	#superclass : #Object,
	#category : #SemanticClustering
}

{ #category : #removing }
CorpusCleaner class >> removeNonAlphabeticTokens: aCorpus [
	^ aCorpus collect: [ :document |
		document select: #isAllLetters ]
]

{ #category : #removing }
CorpusCleaner class >> stemsOfTokens: aCorpus [
	^ aCorpus collect: [ :document |
		document collect: [ :token |
			PGPorterStemmer stemOf: token ] ]
]
