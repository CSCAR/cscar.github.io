# Sourced from https://github.com/audy/make-rmarkdown/blob/master/Makefile

# run `make` to compile all html
# run `make filename.html` to compile one specifically.

# Added '' around *.Rmd to expand properly.
# https://forums.freebsd.org/threads/29885/
Rmd=$(shell find . -name "*.Rmd" ! -path "*/_posts/*")
R_HTML=$(Rmd:.Rmd=.html)

$(info $$R_HTML is [${R_HTML}])
$(info $$Rmd is [${Rmd}])

%.html: %.Rmd
	@echo "$< -> $@"
	@Rscript -e "rmarkdown::render_site('$<')"

default: $(R_HTML)
