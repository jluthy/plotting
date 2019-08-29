#Load Libs. Will be using  data provided from the package ggplot2
library(ggplot2)

qplot(displ,hwy,data=mpg)
qplot(displ,hwy,data=mpg,color=drv)
qplot(displ,hwy,data=mpg,geom=c("point","smooth"))
qplot(displ,hwy,data=mpg,color=manufacturer)
qplot(displ,hwy,data=mpg,color=manufacturer,geom=c("point","smooth"))
qplot(hwy,data=mpg,fill=trans)
box_plot <- ggplot(iris, aes(x=Species, y=Sepal.Width, fill=Species)) +
geom_boxplot() +
labs(x="Species", y="Sepal Width (cm)", fill="Species", title="Iris Dataset")
box_plot
# Can I make this a 3D plot?
plot_gg(box_plot,multicore = TRUE, width = 8, height = 8, scale = 300,
        zoom = 0.6, phi = 60, background = "#afceff",
        shadowcolor = "#3a4f70")

# Histogram with Auto Binning
g <- ggplot(cannabinoids, aes(CBD)) + scale_fill_brewer(palette = "Spectral")

g + geom_histogram(aes(fill=Sample ID),
                   binwidth = .1,
                   col="black",
                   size=.1) +  # change binwidth
  labs(title="Histogram with Auto Binning",
       subtitle="Engine Displacement across Vehicle Classes")




theme_set(theme_classic())
# Histogram on a Categorical variable
g <- ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill=class), width = 0.5) +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  labs(title="Histogram on Categorical Variable",
       subtitle="Manufacturer across Vehicle Classes")
plot_gg(g, width = 4, height = 4, height_aes = mpg, zoom = 0.6)
# g + geom_bar(aes(fill=class), width = 0.5) +
#   theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
#   labs(title="Histogram on Categorical Variable",
#        subtitle="Manufacturer across Vehicle Classes")


# ggplot object
dat <- data.frame(x = 1:5, y = 1:5, p = 1:5, q = factor(1:5),
                  r = factor(1:5))
p <- ggplot(dat, aes(x, y, colour = p, size = q, shape = r)) + geom_point()

# without guide specification
p

# Show colorbar guide for colour.
# All these examples below have a same effect.

p + guides(colour = "colorbar", size = "legend", shape = "legend")
p + guides(colour = guide_colorbar(), size = guide_legend(),
           shape = guide_legend())
p +
  scale_colour_continuous(guide = "colorbar") +
  scale_size_discrete(guide = "legend") +
  scale_shape(guide = "legend")
