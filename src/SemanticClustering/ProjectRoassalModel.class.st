Class {
	#name : #ProjectRoassalModel,
	#superclass : #Object,
	#instVars : [
		'name',
		'point',
		'cluster'
	],
	#category : #SemanticClustering
}

{ #category : #accessing }
ProjectRoassalModel >> cluster [
	^ cluster
]

{ #category : #accessing }
ProjectRoassalModel >> cluster: anObject [
	cluster := anObject
]

{ #category : #accessing }
ProjectRoassalModel >> name [
	^ name
]

{ #category : #accessing }
ProjectRoassalModel >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ProjectRoassalModel >> point [
	^ point
]

{ #category : #accessing }
ProjectRoassalModel >> point: anObject [
	point := anObject
]
