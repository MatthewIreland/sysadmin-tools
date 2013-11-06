sysadmintools -- latex
=====================

This is where I intend to put some scripts for helping automate common repetitive tasks in LaTeX.

./makemake.pl
---------------
TODO: Script to create makefile that scans a directory for .tex (and also perhaps .bib files), and creates a Makefile that correctly compiles these. The makefile should also have a "length" section which uses texcount to perform a word count.
(also might be nice to add a script that adds a "DRAFT" watermark to the pdf when the user types "make draft")