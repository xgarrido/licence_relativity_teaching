# -*- mode: makefile; -*-
files_org  = $(wildcard td*.org)
files_pdf  = doc/pdf/$(files_org:.org=.pdf)
files_html = doc/html/$(files_org:.org=.html)

all: pdf

pdf: $(files_pdf)
doc/pdf/%.pdf: %.org
	@echo "NOTICE: Exporting $< to pdf..."
	@zsh -i -c "org-pages --pdf --debug generate --keep-tmp-files"

html: $(files_html)
doc/html/%.html: %.org
	@echo "NOTICE: Exporting $< to html..."
	@zsh -i -c "org-pages --html --generate-home-link --color=darkblue --debug generate"

clean:
	@rm -rf	latex.d doc *.tex *.pdf *.toc *.fdb* *.fls *.aux *.log *.out *~ README.el _minted* *.xdv

.PHONY: all pdf html clean
