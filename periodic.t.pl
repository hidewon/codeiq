#!/usr/bin/perl
use strict;
use Data::Dumper;

my $periodic_table_data=<<'TABLE';
 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
1 1                 2
2 3 4           5 6 7 8 9 10
3 11 12           13 14 15 16 17 18
4 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36
5 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54
6 55 56 L 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86
7 87 88 A 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118
8 119 120                
L 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71    
A 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103    
TABLE

my $_num_table_ref;
map{chomp;my @datas=split(/ /);$$_num_table_ref{$datas[0]}=\@datas;} split("\n",$periodic_table_data);

my $q=<STDIN>;
print periodic_a($q)."\n";

#print Dumper($_num_table_ref);

sub periodic_a {
 my $c_r=shift @_;

 my ($c,$r)=(split("\,",$c_r))[0,1];
 return $$_num_table_ref{$c}->[$r] || "\-";
}
