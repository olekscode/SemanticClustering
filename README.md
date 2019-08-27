# SemanticClustering
Semantic clustering of source code of Pharo projects, packages, classes, and methods using TF-IDF and t-SNE.

## Installation
To install SemanticClustering, go to the Playground (`Ctrl+OW`) in your fresh Pharo image and execute the following Metacello script (select it and press Do-it button or `Ctrl+D`):

```smalltalk
Metacello new
  baseline: 'SemanticClustering';
  repository: 'github://olekscode/SemanticClustering/src';
  load.
```

## Training the Model

```Smalltalk
projects := #(Morphic Tool System Polymorph Calypso Kernel Athens Metacello OpalCompiler Fuel Monticello Collections Reflectivity OSWindow Rubric Graphics STON UnifiedFFI Zinc SUnit Epicea Refactoring Text Renraku AST Commander Network Keymapping Refactoring2 Regex Shift Debugger Ombu).

clusteringBuilder := SemanticClusteringBuilder new
  projects: projects;
  yourself.
  
"Some steps can take more than 30 min"
clusteringBuilder start.
```

## Loading the Trained Model

You can download the FUEL serialization of a trained `SemanticClustering` object: https://drive.google.com/file/d/1WJTeD8jRpDU7WyMz_FtybPujLMCJj5u-/view?usp=sharing.

```Smalltalk
clusteringBuilder := FLMaterializer materializeFromFileNamed: 'semanticClustering.fuel'.
```
