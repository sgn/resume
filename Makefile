.PHONY: all
all: resume.pdf

resume.pdf: resume.tex
	pdflatex $<
	pdflatex $<
	pdflatex $<
