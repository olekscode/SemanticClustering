Class {
	#name : #ClusterViewModel,
	#superclass : #Object,
	#instVars : [
		'index',
		'centroid',
		'points'
	],
	#category : #SemanticClusteringViewModels
}

{ #category : #accessing }
ClusterViewModel >> centroid [
	^ centroid
]

{ #category : #accessing }
ClusterViewModel >> centroid: anObject [
	centroid := anObject
]

{ #category : #accessing }
ClusterViewModel >> index [
	^ index
]

{ #category : #accessing }
ClusterViewModel >> index: anObject [
	index := anObject
]

{ #category : #accessing }
ClusterViewModel >> points [
	^ points
]

{ #category : #accessing }
ClusterViewModel >> points: anObject [
	points := anObject
]

{ #category : #accessing }
ClusterViewModel >> radius [ 
	| distances |
	distances := self points collect: [ :point |
		KMeans new distanceBetween: point and: self centroid ].
	
	^ distances max
]
