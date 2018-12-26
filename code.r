# -> DBSCAN library:
library('dbscan')

# -> Reading Data:
seeds = read.csv("https://ibm.box.com/shared/static/c1aw37ex3sx99pb9q2l8fwz643wnbeo6.txt", sep="\t")

# -> Creating a subset of feature we'll use on this clustering (with width and length):
seeds.sub = subset(seeds, select = c(width,length))

# -> Obtaining clusters with DSCAN function:
clusters_assignments1 = dbscan(seeds.sub, eps = .08, minPts = 4)

# -> Converting clusters to factors:
clusters_assignments1$cluster = as.factor(clusters_assignments1$cluster)

# -> Adding cluster columns to seeds.subset:
seeds.sub$cluster_no = clusters_assignments1$cluster

# -> Visualizing Results:
{plot(seeds.sub$width, seeds.sub$length, col = clusters_assignments1$cluster, 
     pch = 16, main = "Scatterplot Displaying Clusters", 
     xlab = "Kernel Width", ylab = "Kernel Length")
legend(x = 2.6, y = 6.75, legend = levels(clusters_assignments1$cluster), 
       col = c(1:5), pch = 16, title = "Clusters")}
