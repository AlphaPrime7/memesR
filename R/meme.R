#memer::
devtools::install_github("sctyner/memer")
memer::meme_list()
#get simple oprah meme
memer::meme_get("OprahGiveaway")
#get meme and add text
t <- memer::meme_get("OprahGiveaway") %>%
  memer::meme_text_bottom("Oprah Give to  \n R Devs because WE BROKE!")
t

#memery::
pic <- "lion.jpg"
txt <- c("Could the normfluodbf update be a**?", "Perhaps...")
memery::meme(pic, txt, "lion.jpg")

img <- "lion-wild.gif"
lab <- c("memery", "magic")
pos <- list(w = rep(0.9, 2), h = rep(0.3, 2), x = rep(0.5, 2), y = c(0.9, 0.75))
memery::meme_gif(img, lab, "leo.gif", size = c(1.5, 0.75), label_pos = pos, fps = 20)

#meme::
if (.Platform$OS.type == "windows") {
  windowsFonts(
    Impact = windowsFont("Impact"),
    Courier = windowsFont("Courier")
  )
}

u <- "lion.jpg"
u1 <- "lion.jpg"
u3 <- "lion.jpg"
x <- meme::meme(u, "code", "all the things!")
y <- meme::mmplot(u1) + meme::mm_caption("WOW", "R packages be CRAZY", color="purple")
y <- meme::meme(u, "卧槽-听说你想用中文", "LEARN THE LANGUAGE A**", font="STHeiti")

#using font pokemon
meme::font_pokemon()
z <- meme::meme(u3, "I wish", "pikachu COULD CODE!",font='Pokemon_Solid', color='#FCCF00')
z <- meme::meme(u1, "normfluodbf", "is pretty cool with this update", font='Pokemon_Solid', size = 20, color='#FCCF00')
z <- meme::mmplot(u3) + meme::mm_caption("I wish", "pikachu COULD CODE!", color="purple")

#simple save
meme::meme_save(x, file="ok.png") 
meme_save(z, file="okr.png")
meme_save(z, file="okroo.png")

#complex save
outfile <- tempfile(fileext=".png")
meme::meme_save(y, file=outfile)

#more advanced meming
library(grid)
mm <- meme(u, "code", "all the things!", size=.3, color='firebrick', bgcolor=NULL)

grid.newpage()
pushViewport(viewport(width=.9, height=.9))
grid.rect(gp = gpar(lty="dashed"))

xx <- seq(0, 2*pi , length.out=10)
yy <- sin(xx)

#base
for (i in seq_along(xx)) {
  vp <- viewport(x = xx[i]/(2*pi), y = (yy[i]-min(yy))/2, width=.05, height=.05)
  print(mm, vp = vp)
}

#ggplot
library(ggplot2)
library(ggimage)

d <- data.frame(x = xx, y = yy)
ggplot(d, aes(x, y)) + geom_line() +
  geom_subview(aes(x, y), data=d, subview=mm, width=.3, height=.15)

ggplot(d, aes(x, y)) +
  geom_subview(x = 0, y = 0, subview=mm+aes(size=3), width=Inf, height=Inf) +
  geom_point() + geom_line()

#cowplot
library(cowplot)
plot_grid(x, y, ncol=1, labels = c("A", "B"))
qplot(1:10, 1:10) + labs(title="meme is awesome") +
  theme(plot.title=element_text(family='bubble1', size=30, color='firebrick'))
