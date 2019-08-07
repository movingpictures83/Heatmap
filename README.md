# BoxPlot
# Language: R
# Input: CSV
# Output: Prefix 
# Tested with: PluMA 1.0, R 3.2.5

PluMA plugin to take a CSV file and produce a heatmap of its values. 
The CSV file is assumed to include row and column headers.

The output prefix determines the names of two output files:

(prefix).pdf:  The visual heatmap.
(prefix).csv:  Color value of each bin (mainly to check for correctness).
