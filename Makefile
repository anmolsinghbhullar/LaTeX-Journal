# Fairly basic Makefile. Cleans all auxiliary files.
# Uses your default PDF viewer to open the generated document.
# you can change it via PDF_VIEWER=<your-pdf-of-choice>.
DOCNAME=main

.PHONY:
	clean

# allows u to also run make compile and make clean separately if u so choose
all:
	make compile
	make clean

# standard practice to compile multiple times to ensure accuracy if we ever have
# a fair amount of graphs or the table of contents is accurately generated.
compile:
	pdflatex $(DOCNAME).tex
	pdflatex $(DOCNAME).tex
	pdflatex $(DOCNAME).tex

# I remove emacs backup files since we're already in version control (git)
# the rest are just auxiliary tex files/folders.
clean:
	rm -rf *.aux *.bcf *.fdb_latexmk *.fls *.log *.out *.toc *.syntex* *~

view:
	make compile
	make clean
	open $(DOCNAME).pdf
