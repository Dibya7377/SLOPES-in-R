setwd("E:/R_dibya/LANDSAT_IMAGE")
library(raster)
library(ggplot2)
r = raster("keonjhar_dem.tif")
r = aggregate(r, fact = 2)
slp=terrain(r,opt="slope",unit="degrees")
slp_df=as.data.frame(slp,xy=T)
ggplot()+
  geom_tile(data=slp_df,aes(x=x,y=y,fill=slope))+
  scale_fill_gradientn(colors=topo.colors(10))+
  theme_bw()