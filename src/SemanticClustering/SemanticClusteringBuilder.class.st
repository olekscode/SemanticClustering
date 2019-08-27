Class {
	#name : #SemanticClusteringBuilder,
	#superclass : #Object,
	#instVars : [
		'projects',
		'corpus',
		'tfidfVectors',
		'similarityMatrix',
		'distanceMatrix',
		'points',
		'kmeans',
		'projectModels',
		'clusterModels'
	],
	#category : #SemanticClustering
}

{ #category : #steps }
SemanticClusteringBuilder >> buildClusterModels [
	| clusteredPoints |
	clusteredPoints := self projectModels groupedBy: #cluster.
	
	self clusterModels: (clusteredPoints keys collect: [ :cluster |
		ClusterViewModel new
			index: cluster;
			points: ((clusteredPoints at: cluster) collect: #point);
			centroid: (self kmeans centroids at: cluster);
			yourself ]).
]

{ #category : #steps }
SemanticClusteringBuilder >> buildProjectModels [
	self projectModels: ((1 to: projects size) collect: [:i |
		ProjectViewModel new
			name: (self projects at: i);
			point: (self points at: i);
			cluster: (self kmeans clusters at: i);
			yourself ]).
]

{ #category : #steps }
SemanticClusteringBuilder >> cleanCorpus [
	self removeNonAlphabeticTokens.
	self extractStems.
]

{ #category : #accessing }
SemanticClusteringBuilder >> clusterModels [
	^ clusterModels
]

{ #category : #accessing }
SemanticClusteringBuilder >> clusterModels: anObject [
	clusterModels := anObject
]

{ #category : #steps }
SemanticClusteringBuilder >> computeDistanceMatrix [
	self distanceMatrix: (PMMatrix rows: (1 - self similarityMatrix))
]

{ #category : #steps }
SemanticClusteringBuilder >> computeSimilarityMatrix [
	self similarityMatrix: (self tfidfVectors collect: [ :rowVector |
		self tfidfVectors collect: [ :columnVector |
			rowVector cosineSimilarity: columnVector ]]).
]

{ #category : #steps }
SemanticClusteringBuilder >> computeTFIDFVectors [
	| tfidf |
	tfidf := PGTermFrequencyInverseDocumentFrequency new.
	tfidf trainOn: self corpus.
	self tfidfVectors: (self corpus collect: [ :projectTokens | 
		tfidf vectorFor: projectTokens ]).
]

{ #category : #accessing }
SemanticClusteringBuilder >> corpus [
	^ corpus
]

{ #category : #accessing }
SemanticClusteringBuilder >> corpus: anObject [
	corpus := anObject
]

{ #category : #accessing }
SemanticClusteringBuilder >> distanceMatrix [
	^ distanceMatrix
]

{ #category : #accessing }
SemanticClusteringBuilder >> distanceMatrix: anObject [
	distanceMatrix := anObject
]

{ #category : #steps }
SemanticClusteringBuilder >> extractStems [
	self corpus: (self corpus collect: [ :document |
		document collect: [ :token |
			PGPorterStemmer stemOf: token ] ])
]

{ #category : #steps }
SemanticClusteringBuilder >> findKMeansClusters [
	self kmeans: (KMeans numberOfClusters: 7).
	self kmeans fit: self points.
]

{ #category : #accessing }
SemanticClusteringBuilder >> kmeans [
	^ kmeans
]

{ #category : #accessing }
SemanticClusteringBuilder >> kmeans: anObject [
	kmeans := anObject
]

{ #category : #steps }
SemanticClusteringBuilder >> loadCorpus [
	self corpus: (Corpus fromProjects: self projects)
]

{ #category : #accessing }
SemanticClusteringBuilder >> points [
	^ points
]

{ #category : #accessing }
SemanticClusteringBuilder >> points: anObject [
	points := anObject
]

{ #category : #accessing }
SemanticClusteringBuilder >> projectModels [
	^ projectModels
]

{ #category : #accessing }
SemanticClusteringBuilder >> projectModels: anObject [
	projectModels := anObject
]

{ #category : #accessing }
SemanticClusteringBuilder >> projects [
	^ projects
]

{ #category : #accessing }
SemanticClusteringBuilder >> projects: anObject [
	projects := anObject
]

{ #category : #steps }
SemanticClusteringBuilder >> reduceDimensionalityWithTSNE [
	| tsne |
	tsne := PMTSNE new
		perplexity: 5;
		x: self distanceMatrix;
		yourself.
		
	tsne start.
	self points: tsne y rows.
]

{ #category : #steps }
SemanticClusteringBuilder >> removeNonAlphabeticTokens [
	self corpus: (self corpus collect: [ :document |
		document select: #isAllLetters ]).
]

{ #category : #accessing }
SemanticClusteringBuilder >> similarityMatrix [
	^ similarityMatrix
]

{ #category : #accessing }
SemanticClusteringBuilder >> similarityMatrix: anObject [
	similarityMatrix := anObject
]

{ #category : #steps }
SemanticClusteringBuilder >> start [ 	
	self loadCorpus.
	self cleanCorpus.
	self computeTFIDFVectors.
	self computeSimilarityMatrix.
	self computeDistanceMatrix.
	self reduceDimensionalityWithTSNE.
	self findKMeansClusters.
	self buildProjectModels.
	self buildClusterModels.
]

{ #category : #accessing }
SemanticClusteringBuilder >> tfidfVectors [
	^ tfidfVectors
]

{ #category : #accessing }
SemanticClusteringBuilder >> tfidfVectors: anObject [
	tfidfVectors := anObject
]
