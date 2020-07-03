# Heatmap
# Language: R
# Input: CSV
# Output: Prefix 
# Tested with: PluMA 1.1, R 4.0.0
# Dependency: gplots_3.0.3

PluMA plugin to take a CSV file and produce a heatmap of its values. 
The CSV file is assumed to include row and column headers.

The output prefix determines the names of two output files:

(prefix).pdf:  The visual heatmap.
(prefix).csv:  Color value of each bin (mainly to check for correctness).
