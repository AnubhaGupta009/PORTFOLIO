#### Using K-Means Clustering algorithm on IRIS Data set


# Installing Packages
install.packages("ClusterR")
install.packages("cluster")
# Loading package
library(ClusterR)
library(cluster)

# Load Dataset & Removing initial label of
# Species from original dataset
library(readr)
iris <- read_csv("C:/Users/Riya/Downloads/batch 55-22 august zip/PROJECT_FILE/mp/iris.csv")
str(iris)
head(iris)

iris_1 <- iris[, -5]

# Fitting K-Means clustering Model
# to training dataset
set.seed(240) # Setting seed
kmeans.re <- kmeans(iris_1, centers = 3, nstart = 20)
kmeans.re

# Cluster identification for
# each observation
kmeans.re$cluster

# Confusion Matrix
cm <- table(iris$variety, kmeans.re$cluster)
cm

# Model Evaluation and visualization

plot(iris_1[c("sepal.length", "sepal.width")],
     col = kmeans.re$cluster,
     main = "K-means with 3 clusters")

## Plotiing cluster centers
kmeans.re$centers
kmeans.re$centers[, c("sepal.length", "sepal.width")]

# cex is font size, pch is symbol
points(kmeans.re$centers[, c("sepal.length", "sepal.width")],
       col = 1:3, pch = 8, cex = 3)

## Visualizing clusters
y_kmeans <- kmeans.re$cluster
clusplot(iris_1[, c("sepal.length", "sepal.width")],
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("Cluster iris"),
         xlab = 'sepal.length',
         ylab = 'sepal.width')
