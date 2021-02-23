PDFDIR= docs/pdf
TEXDIR= tex

vpath %.tex $(TEXDIR)

ALL= \
	$(PDFDIR)/syllabus.pdf \
	$(PDFDIR)/ps-1.pdf \
	$(PDFDIR)/ans-1.pdf \
	$(PDFDIR)/ps-2.pdf

# $(PDFDIR)/%.pdf $(PDFDIR)/%-answers.pdf: $(TEXDIR)/%.tex $(TEXDIR)/exex.bib \
# 	$(TEXDIR)/%-text.tex $(TEXDIR)/%-answers.tex $(TEXDIR)/exex_defs.tex
# 	cd $(TEXDIR); pdflatex $(*F); bibtex $(*F); pdflatex $(*F); pdflatex $(*F)
# 	cd $(TEXDIR); pdflatex $(*F)-answers; bibtex $(*F)-answers; pdflatex $(*F)-answers; pdflatex $(*F)-answers
# 	mv $(TEXDIR)/$(*F).pdf $(PDFDIR)
# 	mv $(TEXDIR)/$(*F)-answers.pdf $(PDFDIR)

$(PDFDIR)/%.pdf: $(TEXDIR)/%.tex
	cd $(TEXDIR); pdflatex $(*F); bibtex $(*F); pdflatex $(*F); pdflatex $(*F)
	mv $(TEXDIR)/$(*F).pdf $(PDFDIR)

all: $(ALL)

texclean:
	rm -f $(TEXDIR)/*.log $(TEXDIR)/*.aux $(TEXDIR)/*.bbl $(TEXDIR)/*.blg $(TEXDIR)/*.out

fullclean: texclean
	rm -f $(PDFDIR)/*.pdf

dummy:
