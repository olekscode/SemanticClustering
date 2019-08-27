Class {
	#name : #ClusteringVisualizer,
	#superclass : #Object,
	#instVars : [
		'pointModels',
		'clusterModels',
		'view'
	],
	#category : #ClusteringVisualizer
}

{ #category : #accessing }
ClusteringVisualizer >> clusterModels [
	^ clusterModels
]

{ #category : #accessing }
ClusteringVisualizer >> clusterModels: anObject [
	clusterModels := anObject
]

{ #category : #initialization }
ClusteringVisualizer >> drawClusters [
	| ellipse |
	
	clusterModels do: [ :clusterModel |
		ellipse := TSEllipse new
			color: ((TSCPDiverging new spectral7 range at: clusterModel index) alpha: 0.3);
			size: (clusterModel radius * 2);
			position: (clusterModel centroid second @ clusterModel centroid first);
			yourself.
		
		self view addShape: ellipse ].
]

{ #category : #initialization }
ClusteringVisualizer >> drawPoints [
	| ellipse label |
	
	pointModels do: [ :pointModel |
		ellipse := TSEllipse new
			color: (TSCPDiverging new spectral7 range at: pointModel cluster);
			size: 10;
			position: (pointModel point second @ pointModel point first);
			yourself.
		
		self view addShape: ellipse.
	
		label := TSLabel new 
			color: Color black;
			text: pointModel name;
			yourself.
		
		self view addShape: label.
	
		RSLocation new 
			outer; top;
			move: label on: ellipse ].
]

{ #category : #initialization }
ClusteringVisualizer >> initialize [
	super initialize.
	self view: RSView new.
	self view @ RSControlsView.
]

{ #category : #initialization }
ClusteringVisualizer >> open [ 
	^ self view open
]

{ #category : #accessing }
ClusteringVisualizer >> pointModels [
	^ pointModels
]

{ #category : #accessing }
ClusteringVisualizer >> pointModels: anObject [
	pointModels := anObject
]

{ #category : #accessing }
ClusteringVisualizer >> view [
	^ view
]

{ #category : #accessing }
ClusteringVisualizer >> view: anObject [
	view := anObject
]
