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
