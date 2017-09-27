all: dplyr.html ggplot2.html challenge_slides.html

R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

%.html: %.Rmd
	R $(R_OPTS) -e "rmarkdown::render('$<')"

challenge_slides.Rmd: ruby/grab_challenges.rb dplyr.Rmd ggplot2.Rmd
	$<
