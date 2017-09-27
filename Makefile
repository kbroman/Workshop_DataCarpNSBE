all: dplyr.html ggplot2.html

R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

%.html: %.Rmd
	R $(R_OPTS) -e "rmarkdown::render('$<')"
