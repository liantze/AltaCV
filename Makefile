#
# Makefile
#


# Change the file name with yours
FILE_NAME = sample


###### Docker ######
D_DIR = Docker
D_IMAGE = dockercv
D_CONTAINER = dockercv-container

# Current working directory
PATH_SHARED = $(shell pwd)

FLAGS = --rm -ti
VOLUME = -v $(PATH_SHARED):/home/dockuser/shared
D_FLAGS = $(FLAGS) --name $(D_CONTAINER) $(VOLUME)

###### LaTeX ######
L_DIR = .
L_SRC = $(FILE_NAME).tex

LATEXMK = latexmk
L_FLAGS = -pdf -cd -f -interaction=nonstopmode -file-line-error

# Core latex/pdflatex auxiliary files
AUX1 = *.acv *.aux *.lof *.log *.lot *.fls *.out *.toc *.fmt *.fot *.cb *.cb2 .*.lb
# Intermediate documents
AUX2 = *.dvi *.xdv *-converted-to.*
# Bibliography auxiliary files (bibtex/biblatex/biber)
AUX3 = *.bbl *.bcf *.blg *-blx.aux *-blx.bib *.run.xml
# Build tool auxiliary files
AUX4 = *.fdb_latexmk *.synctex *.synctex(busy) *.synctex.gz *.synctex.gz(busy) *.pdfsync
# Beamer
AUX5 = *.nav *.pre *.snm *.vrb
# Glossaries
AUX6 = *.acn *.acr *.glg *.glo *.gls *.glsdefs
# Algorithms
AUX7 = *.alg *.loa
# Makeidx
AUX8 = *.idx *.ilg *.ind *.ist
AUX_FILES = $(AUX1) $(AUX2) $(AUX3) $(AUX4) $(AUX5) $(AUX6) $(AUX7) $(AUX8)

#############################################
#############################################
#############################################

###### Docker ######
build:
	docker build -t $(D_IMAGE) $(D_DIR)

run:
	docker run $(D_FLAGS) $(D_IMAGE)

bash:
	docker run $(D_FLAGS) $(D_IMAGE) bash

###### LaTeX ######
pdf:
	$(LATEXMK) $(L_FLAGS) $(L_DIR)/$(L_SRC)

clean:
	@rm -f $(foreach file, $(AUX_FILES), $(wildcard $(file)))
	@echo "Removed all aux files"

clean-all: clean
	@rm -f *.pdf
	@echo "Removed all pdf files"
