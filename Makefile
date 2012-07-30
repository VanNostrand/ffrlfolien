# die folgenden Targets haben keine Abhängigkeiten und werden immer ausgeführt
.PHONY: help clean distclean

# Variablendeklarationen: TeX-Müll, Ausgaben, Preprocessor, TeX-includes
obj = *log *lof *bbl *blg *out *aux *toc *nav *snm *vrb *.table *.gnuplot *.tex~ *.backup
out = *pdf
mininc = packages.tex bibliographie.bib titlepage.tex
ausinc = $(mininc) pdfsetup.tex titlepage.tex
folinc = $(mininc) titlepage.tex

# Targets: Hilfe, alles, Ausarbeitung, Folien und Preprocessing
help:	
	@echo 'make [all|nt|tech|Folien|clean|distclean]'

all:	$+ nt tech Folien

# foo.pre -> foo.tex
$(preproc): %.tex: %.pre
	filepp $< -o $@

nt:
	pdflatex Folien-nontech.tex
	pdflatex Folien-nontech.tex
tech:
	pdflatex Folien-tech.tex
	pdflatex Folien-tech.tex

Folien: Folien.tex $(folinc)
	pdflatex Folien.tex

clean:
	@rm -f $(obj)
distclean:
	@rm -f $(obj) $(out) $(preproc)
