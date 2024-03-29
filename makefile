PDFDIR= docs/pdf
TEXDIR= tex

vpath %.tex $(TEXDIR)

ALL= \
	$(PDFDIR)/syllabus.pdf \
	$(PDFDIR)/ps-1.pdf \
	$(PDFDIR)/ans-1.pdf \
	$(PDFDIR)/ans-2.pdf \
	$(PDFDIR)/ans-3.pdf \
	$(PDFDIR)/ans-4.pdf \
	$(PDFDIR)/ans-5.pdf \
	$(PDFDIR)/ans-6.pdf \
	$(PDFDIR)/ans-7.pdf \
	$(PDFDIR)/ans-8.pdf \
	$(PDFDIR)/ps-2.pdf \
	$(PDFDIR)/ps-6.pdf \
	$(PDFDIR)/ps-4.pdf \
	$(PDFDIR)/ps-5.pdf \
	$(PDFDIR)/ps-7.pdf \
	$(PDFDIR)/ps-8.pdf \
	$(PDFDIR)/ps-9.pdf \
	$(PDFDIR)/ps-3.pdf

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
