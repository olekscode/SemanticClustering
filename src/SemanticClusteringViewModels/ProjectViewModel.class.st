Class {
	#name : #ProjectViewModel,
	#superclass : #Object,
	#instVars : [
		'name',
		'point',
		'cluster'
	],
	#category : #SemanticClusteringViewModels
}

{ #category : #accessing }
ProjectViewModel >> cluster [
	^ cluster
]

{ #category : #accessing }
ProjectViewModel >> cluster: anObject [
	cluster := anObject
]

{ #category : #accessing }
ProjectViewModel >> name [
	^ name
]

{ #category : #accessing }
ProjectViewModel >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ProjectViewModel >> point [
	^ point
]

{ #category : #accessing }
ProjectViewModel >> point: anObject [
	point := anObject
]
