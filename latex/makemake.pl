#!/usr/bin/perl -w
# USAGE: ./makemake.pl [-i <name of main .tex file>] [-o <name of pdf output>] [-b <name of bibtex file>] [-d <directory to use (if not equal to current one)>]
# Constructs a makefile for a LaTeX document
# Matthew Ireland, November MMXIII

use warnings;
use diagnostics;
use POSIX qw(strftime);

# TODO: parse input arguments (name of object file [optional])
# TODO: prompt user for name of main .tex file
# TODO: prompt
# TODO: prompt user for name of bibtex file (


# open makefile and print header
open (MAKEFILE, '>Makefile');
print MAKEFILE "# AUTOGENERATED --- DO NOT EDIT THIS FILE\n";
my $date = strftime("%m/%d/%Y", localtime);
my $username = $ENV{LOGNAME} || $ENV{USER} || getpwuid($<);
print MAKEFILE "# Created on $date by ${username}\n";
# TODO: print name of pdf file and description




# TODO: handle case when input file already exists

# TODO: generate title.tex

# TODO: handle case where .bib file doesn't exist



# TODO: call template generation script (to populate main file)
#       pass name of bibliography, if existent