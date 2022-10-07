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
set terminal postscript eps size 5.5,4.25 enhanced color \
    font 'Helvetica,20' linewidth 1.5
set output '../figs/tx_scores_vs_EOBS_years.eps'
set multiplot layout 2,1 rowsfirst
#set rmargin 17
#set lmargin 8
set key inside right bottom
set grid ytics lc rgb "gray" lw 1
set border linewidth 1.2

# Y-axis
set ylabel "RMSE"
set yrange [1.5:3.5]
set format y "%.1f"
set ytics 1,0.5
# X-axis
set xlabel ""
set xrange [1981:2019]
set title "Daily maximum temperature"

set datafile separator ";"

vs = "2007.5"
set for [v in vs] arrow from v, graph 0 to v, graph 1 lw 2.5 lc "black" dt 2 nohead

set label 1 at graph 0.92,0.9 font ',8'
plot '../res/tx_RMSE_vs_EOBS_years.csv' using 2:3 with linespoints linestyle 1 title "ERA5-Land", \
                                     '' using 2:4 with linespoints linestyle 2 title "MOLOCH", \
                                     '' using 2:5 with linespoints linestyle 3 title "BOLAM"

# Y-axis
set ylabel "bias"
set yrange [0.8:1.2]
set format y "%.1f"
set ytics 0.8,0.1
# X-axis
set xlabel ""
set xrange [1981:2019]
set title ""

vs = "2007.5"
set for [v in vs] arrow from v, graph 0 to v, graph 1 lw 2.5 lc "black" dt 2 nohead

set label 1 '' at graph 0.92,0.9 font ',8'
plot '../res/tx_BIAS_vs_EOBS_years.csv' using 2:3 with linespoints linestyle 1 notitle, \
                                     '' using 2:4 with linespoints linestyle 2 notitle, \
                                     '' using 2:5 with linespoints linestyle 3 notitle 
## Y-axis
#set ylabel "Correlation coefficient"
#set yrange [0.9:1.0]
#set format y "%.2f"
#set ytics 0.9,0.05
## X-axis
#set xlabel "Years"
#set xrange [1981:2019]
#set title ""
#
#set label 1 '' at graph 0.92,0.9 font ',8'
#plot '../res/tx_CORR_vs_EOBS_years.csv' using 2:3 with linespoints linestyle 1 notitle, \
                                     '' using 2:4 with linespoints linestyle 2 notitle, \
                                     '' using 2:5 with linespoints linestyle 3 notitle 

quit

