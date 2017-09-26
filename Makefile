all: dplyr.html

R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

dplyr.html: dplyr.Rmd
	R $(R_OPTS) -e "rmarkdown::render('$<')"
