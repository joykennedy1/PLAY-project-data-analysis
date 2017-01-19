# PLAY-project-data-analysis
Code and files related to analyzing flat-file data collected for the PLAY project.

- `analysis/` : R code and data files
	- `*.R` : Functions to manipulate and clean data 	
	- `analysis/data/csv` : CSV files from measures of ambient sound.
	- `analysis/data/xml` : XML format data from metadata app. **Not** stored on GitHub now because it contains identifiable elements.

- `ambient_sound_levels.{Rmd,html}` : R Markdown report on data cleaning, visualization of ambient sound level data files.
- `tablet_app_metadata.{Rmd,html}` : R Markdown report files on data cleaning of metadata stored in XML format.
- `cdi-wordbank-format.{md,html}` : Info about how to format M-CDI data for easy import into [WordBank](http://wordbank.stanford.edu).

- `demographics/` : Scripts and files related to the data collection sites and the demographics of the surrounding area from which PIs might recruit participants.

