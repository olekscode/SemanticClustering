Class {
	#name : #ClusterRoassalModel,
	#superclass : #Object,
	#instVars : [
		'centroid',
		'points'
	],
	#category : #SemanticClustering
}

{ #category : #accessing }
ClusterRoassalModel >> centroid [
	^ centroid
]

{ #category : #accessing }
ClusterRoassalModel >> centroid: anObject [
	centroid := anObject
]

{ #category : #accessing }
ClusterRoassalModel >> points [
	^ points
]

{ #category : #accessing }
ClusterRoassalModel >> points: anObject [
	points := anObject
]

{ #category : #accessing }
ClusterRoassalModel >> radius [ 
	| distances |
	distances := self points collect: [ :point |
		KMeans new distanceBetween: point and: self centroid ].
	
	^ distances max
]
