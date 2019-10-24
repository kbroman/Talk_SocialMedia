R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

STEM = socialmedia

docs/$(STEM).pdf: $(STEM).pdf
	cp $< $@

Figs/deathbulge_155.jpg:
	curl http://www.deathbulge.com/images/comics/155.jpg -o $@

$(STEM).pdf: $(STEM).tex header.tex Figs/deathbulge_155.jpg
	xelatex $<

web: $(STEM).pdf
	scp $(STEM).pdf adhara.biostat.wisc.edu:Website/presentations/$(STEM).pdf
