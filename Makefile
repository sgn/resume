.PHONY: all
all: resume.pdf

resume.pdf: resume.tex tucv.sty
	pdflatex $<
	pdflatex $<
	pdflatex $<

tucv.sty: tucv.ins
	latex $<

.PHONY: clean
clean:
	rm -rf resume.aux resume.log resume.out resume.pdf tucv.sty tucv.log
