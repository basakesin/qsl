# Quasi-supervised Learning (QSL)
----
Quasi-supervised Learning (QSL) computes the posterior probabilities of two classes at the data points in Z. The class labels are stored in the vector Y. k denotes the number of points to be included in the reference set for exhaustive nearest neighbor classifications, and D is the symmetrical matrix of pairwise distances of the points in Z.


## Usage
----
```
library(mvtnorm)
n<-1000
x<- rmvnorm(n, c(0,0))
y<- rmvnorm(n, c(0,4))
z <- rbind(x,y)
label1 <-rep(0, times = n)
label2 <-rep(1, times = n)
label<- c(label1,label2)
D <- as.matrix(dist(z, method = "euclidean", p = 2, diag = TRUE, upper = TRUE))
N <- 2*n
k<- 1
P0<-qsl(z,label,D,N,k)
```
## Dependencies
-----
In order to use qsl function, you need to add kstar.R function into your workspace.

## Author
----
Basak Esin KOKTURK GUZEL

## Credits
----
QSL toolbox for MATLAB

http://likya.iyte.edu.tr/~bilgekaracali/Projects/QSL/


If you use the algorithm, please cite:

B. Karacali, "Quasi-supervised learning for biomedical data analysis," Pattern Recognition, Vol. 43, No. 10, p. 3674-3682, 2010

