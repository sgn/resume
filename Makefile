.PHONY: all
all: resume.pdf

resume.pdf: resume.tex
	pdflatex $<
	pdflatex $<
	pdflatex $<

.PHONY: clean
clean:
	rm -rf resume.aux resume.log resume.out resume.pdf
