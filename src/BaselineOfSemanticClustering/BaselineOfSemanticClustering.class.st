Class {
	#name : #BaselineOfSemanticClustering,
	#superclass : #BaselineOf,
	#category : #BaselineOfSemanticClustering
}

{ #category : #baselines }
BaselineOfSemanticClustering >> baselineOf: spec [ 
	<baseline>
	spec for: #common do: [
		"External dependencies"
		spec
			baseline: 'CodeTokenizer'
			with: [ spec repository: 'github://olekscode/CodeTokenizer/src' ].
			
		spec
			baseline: 'Polyglot'
			with: [ spec repository: 'github://PolyMathOrg/Polyglot/src' ].
			
		spec
			baseline: 'PolyMath'
			with: [ spec repository: 'github://PolyMathOrg/PolyMath:v1.0/src' ].
			
		spec
			baseline: 'KMeans'
			with: [ spec repository: 'github://olekscode/KMeans/src' ].
			
		spec
			baseline: 'Roassal3'
			with: [ spec repository: 'github://ObjectProfile/Roassal3' ].

		"Packages"
		spec 
			package: 'SemanticClustering'
			with: [ spec requires: #(CodeTokenizer Polyglot PolyMath KMeans Roassal3) ] ].
]
