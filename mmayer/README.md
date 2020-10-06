# Generate PDF

Each Docker-compose has the following switches as env vars:

Inputs: see `docker-compose.yaml` with possible env vars:

| Option | Description | Required
| ------ | ----------- | ------- |
| TEX_FILENAME=main | Name of the tex file. Say "main.tex". Running latexpdf might generate main.aux (if references are included set WITH_BIB=true) | Yes |
| WITH_BIB=true | If you have Bib references, just say so. | No |
| CLEAN_LATEX_LOGS=true | Clean the logs generated | No |
| RENAME_PDF_AS=mmayers-resume | Rename the final PDF with the name. Say "main.pdf -> RENAME_PDF_AS.pdf | No |

# Running

* Just execute `docker-compose up`

