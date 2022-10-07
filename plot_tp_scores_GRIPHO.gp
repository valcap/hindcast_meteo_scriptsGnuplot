#!/usr/bin/env gnuplot

# reset
reset

# set line styles
set style line 1 \
    linecolor rgb 'red' \
    linetype 1 linewidth 3 \
    pointtype -1 pointsize 2
set style line 2 \
    linecolor rgb 'orange' \
    linetype 1 linewidth 3 \
    pointtype -1 pointsize 2
set style line 3 \
    linecolor rgb 'blue' \
    linetype 1 linewidth 3 \
    pointtype -1 pointsize 2
set style line 10 \
    linecolor rgb 'gray' \
    linetype 3 linewidth 3 \
    pointtype -1 

# same ratio as in Grads (11/8.5)
set terminal postscript eps size 4.25,5.5 enhanced color \
    font 'Helvetica,15' linewidth 1.5
#################################################
set output '../figs/tp_scores_vs_GRIPHO_years.eps'
set multiplot layout 4,1 rowsfirst
set key inside right top
set key inside center top
set key inside left top
set grid ytics lc rgb "gray" lw 1
set border linewidth 1.2

# RMSE
# Y-axis
set ylabel "RMSE"
set yrange [200:600]
set format y "%.0f"
set ytics 250,100
# X-axis
set xlabel ""
set xrange [2001:2016]
#set xtics rotate by 45 right
#################################################
set title "Total annual precipitation (GRIPHO)"

set datafile separator ";"

set label '(a)' at graph 0.01,1.09 font ",18"
#################################################
plot '../res/tp_RMSE_vs_GRIPHO_years.csv' using 1:2 with linespoints linestyle 1 title "ERA5-Land", \
                                       '' using 1:3 with linespoints linestyle 2 title "MOLOCH", \
                                       '' using 1:4 with linespoints linestyle 3 title "BOLAM"
unset label

# Mean Error
# Y-axis
set ylabel "Mean Error"
set yrange [-200:300]
set format y "%.0f"
set ytics -100,100
# X-axis
set xrange [2001:2016]
set title ""

set label '(b)' at graph 0.01,1.09 font ",18"
#################################################
plot '../res/tp_ME_vs_GRIPHO_years.csv' using 1:2 with linespoints linestyle 1 notitle, \
                                     '' using 1:3 with linespoints linestyle 2 notitle, \
                                     '' using 1:4 with linespoints linestyle 3 notitle
unset label

# m-bias
# Y-axis
set ylabel "m-bias"
set yrange [0.8:1.5]
set format y "%.1f"
set ytics 0.9,0.1
# X-axis
set xlabel ""
set xrange [2001:2016]
set title ""

set label '(c)' at graph 0.01,1.09 font ",18"
#################################################
plot '../res/tp_MBIAS_vs_GRIPHO_years.csv' using 1:2 with linespoints linestyle 1 notitle, \
                                        '' using 1:3 with linespoints linestyle 2 notitle, \
                                        '' using 1:4 with linespoints linestyle 3 notitle 
unset label

# Correlation coefficient
# Y-axis
set ylabel "Correlation coefficient"
set yrange [0.4:1.0]
set format y "%.1f"
set ytics 0.5,0.1
# X-axis
set xlabel "Years"
set xrange [2001:2016]
set title ""

set label '(d)' at graph 0.01,1.09 font ",18"
#################################################
plot '../res/tp_CORR_vs_GRIPHO_years.csv' using 1:2 with linespoints linestyle 1 notitle, \
                                       '' using 1:3 with linespoints linestyle 2 notitle, \
                                       '' using 1:4 with linespoints linestyle 3 notitle 
unset label

quit

