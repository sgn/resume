.PHONY: all
all: resume.pdf

%.pdf: %.tex fullpage.sty
	pdflatex $<
	pdflatex $<
	pdflatex $<

%.sty: %.ins
	latex $<

.PHONY: clean
clean:
	rm -rf *.aux *.log *.out *.pdf *.sty *.drv
