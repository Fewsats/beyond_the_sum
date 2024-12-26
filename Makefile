.NOTPARALLEL:  # This forces sequential execution


.PHONY: all clean arxiv

all:
	pdflatex -interaction=nonstopmode beyond_the_sum.tex
	bibtex beyond_the_sum
	pdflatex -interaction=nonstopmode beyond_the_sum.tex
	pdflatex -interaction=nonstopmode beyond_the_sum.tex
arxiv: beyond_the_sum.tex references.bib
	latex beyond_the_sum.tex
	bibtex beyond_the_sum
	# Check if bbl file exists
	@if [ ! -f beyond_the_sum.bbl ]; then \
		echo "Error: beyond_the_sum.bbl not generated"; \
		exit 1; \
	fi
	@echo "Now copy beyond_the_sum.bbl content into beyond_the_sum.tex"
	@echo "and comment out \\bibliography{references}"


clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.pdf *.dvi