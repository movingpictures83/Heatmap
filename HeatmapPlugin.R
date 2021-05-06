library(gplots);

plot_st.heatmap <- function(M, name, noFolder=FALSE) {
#########################################################
### Customizing and plotting the heat map
#########################################################

# creates a own color palette from red to green
my_palette <- colorRampPalette(c("red", "black", "green"))(n = 299)
#my_palette <- colorRampPalette(c("black", "green"))(n = 299)

# (optional) defines the color breaks manually for a "skewed" color transition
#col_breaks = c(seq(-1,0,length=100),  # for red
#  seq(0,0.5,length=100),              # for yellow
#  seq(0.5,1,length=100))              # for green
col_breaks = c(seq(min(0,min(M)), max(M), length=300));
#col_breaks = c(seq(-1, 1, length=300));

file <- name;
# creates a 5 x 5 inch image
#if(noFolder){
#	file <- name;
##}else{
#file <- file.path(dir.figures, name);
#}

colores <- rainbow(ncol(M))

pdf(file,                # create PNG for the heat map        
  width = 5*5,        # 5 x 300 pixels
  height = 5*5);#,
  #res = 300,            # 300 pixels per inch
  #pointsize = 6)        # smaller font size

h <- heatmap.2(M, 
  #cellnote = mat_data,  # same data set for cell labels
  main = "Correlation", # heat map title
  notecol="black",      # change font color of cell labels to black
  density.info="none",  # turns off density plot inside color legend
  trace="none",         # turns on trace lines inside the heat map
  margins =c(30,30),    # widens margins around plot
  col=my_palette,       # use on color palette defined earlier 
  breaks=col_breaks,    # enable color transition at specified limits
  keysize=0.5,
  cexCol=2,
  labRow = colnames(M),
  cexRow=2,
  #ColSideColors = colores,
  #RowSideColors = colores,
  dendrogram="none",    # no dendograms
  Rowv="NA",            # turn off row clustering
  Colv="NA")            # turn off column clustering


dev.off();               # close the PNG device
return(h);
}

plot_st.heatmap_w_colors<- function(M, name, noFolder=FALSE, colorList) {
#########################################################
### Customizing and plotting the heat map
#########################################################

# creates a own color palette from red to green
my_palette <- colorRampPalette(c("red", "black", "green"))(n = 299)

# (optional) defines the color breaks manually for a "skewed" color transition
#col_breaks = c(seq(-1,0,length=100),  # for red
#  seq(0,0.5,length=100),              # for yellow
#  seq(0.5,1,length=100))              # for green
#col_breaks = c(seq(min(0,min(M)), max(M), length=300));
col_breaks = c(seq(-1, 1, length=300));

# creates a 5 x 5 inch image
#if(noFolder){
	file <- name;
#}else{
#file <- file.path(dir.figures, name);
#}

colores <- colorList

#png(file,                # create PNG for the heat map        
#  width = 10*300,        # 5 x 300 pixels
#  height = 10*300,
#  res = 300,            # 300 pixels per inch
#  pointsize = 6)        # smaller font size

svg(file, width = 30, height = 30)

heatmap.2(M, 
  cellnote = mat_data,  # same data set for cell labels
  
  main = "Correlation", # heat map title
  notecol="black",      # change font color of cell labels to black
  density.info="none",  # turns off density plot inside color legend
  trace="none",         # turns on trace lines inside the heat map
  margins =c(30,30),    # widens margins around plot
  col=my_palette,       # use on color palette defined earlier 
  breaks=col_breaks,    # enable color transition at specified limits
  keysize=0.5,
  #ColSideColors = colores,
  RowSideColors = colores,
  dendrogram="none",    # no dendograms
  Rowv="NA",            # turn off row clustering
  Colv="NA")            # turn off column clustering

  #lines(c(0,0.1,0.2,0.3,0.4,0.5), c(0,0.1,0.2,0.3,0.4,0.5), type="b", col="#0000FFFF")
  
dev.off()               # close the PNG device
}

input <- function(inputfile) {
   my_data <<- read.csv(inputfile, header = T);
   my_data <<- apply(my_data, 1, as.numeric);
   #my_data <<- my_data[,-1];
}

run <- function() {
}

output <- function(outputfile) {
   h <- plot_st.heatmap(my_data, paste(outputfile,"pdf",sep="."));
   write.table(h$colorTable, file=paste(outputfile,"csv",sep="."),sep=",");
   #pdf(paste(outputfile,"pdf",sep="."));#, height=1500, width=10000);
   #b <- boxplot(rawdata);  # Have to run after the PDF
   #write.table(b$stats, file=paste(outputfile,"csv",sep="."),sep=",");
   #dev.off();
}
