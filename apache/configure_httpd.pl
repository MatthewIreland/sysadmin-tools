#!/usr/bin/perl
# USAGE: ./configure_httpd.pl <path to httpd.conf/httpd.conf>
use string;
use warnings;

my $path_to_httpd;
($path_to_httpd) = @ARGV;

my $httpd_in; my $httpd_out;
open($httpd_in, "<", $path_to_httpd) or die "Could not open httpd.conf";
open($httpd_out, ">", "/tmp/httpd.conf") or die "Could not write to /tmp";

while ( my $line = <$httpd_in> ) {
    
}



