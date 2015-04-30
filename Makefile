SRC = paper

all: $(SRC).tex
	rubber -f --pdf -s $<
	rubber-info $<
	open $(SRC).pdf

check: $(SRC).tex
	chktex $<
	ispell -t $<

gray: $(SRC).pdf
	pdf2ps -sDEVICE=psgray $(SRC).pdf - |ps2pdf - $(SRC)-gray.pdf


clean:
	rm -f *.aux *.log

spotless: clean
	rm -f *.dvi *.bak *.bbl *.blg
