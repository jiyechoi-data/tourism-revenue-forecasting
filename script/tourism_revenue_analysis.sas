data travel;
input x y @@; time=_n_; datalines;
685086 1074000 755084 989000 907666 1210000 843552 1293000 785687 1290000 887190 1176000 1013739 1269000 1164252 1267000 1006848 1393000 966039 1253000 820962 1122000 842229 1108000 851018 1280000 900721 1190000 1138863 1422000 1251485 1456000 1240837 1462000 1275695 1464000 1362423 1615000 1467386 1544000 1250600 1765000 1318671 1707000 1119138 1684000 1087671 1596000 929459 1270000 1065059 1200000 1253519 1562000 1390633 1599000 1340531 1595000 762942 944000 644857 826000 1090496 1006000 1216136 1212000 1389128 1342000 1156785 1290000 1120156 1296000 run;
                               
/* Plot raw data for x (tourist counts) */
symbol1 i=join v=star ci=red; 
proc gplot data=travel;
plot x*time=1;
run;

/* Plot raw data for y (tourism revenue) */
symbol1 i=join v=star ci=blue; 
proc gplot data=travel;
plot y*time=1;
run;

/* Square root transformation */
data travel1; 
set travel; 
x1 = sqrt(x); 
y1 = sqrt(y);

/* Plot transformed data for x1 */
symbol1 i=join v=star ci=red; 
proc gplot data=travel1;
plot x1*time=1;
run;

/* Plot transformed data for y1 */
symbol1 i=join v=star ci=blue; 
proc gplot data=travel1;
plot y1*time=1;
run;

/* Check ACF and PACF for x1 */
proc arima data=travel1; 
identify var=x1;
run;

/* Check ACF and PACF for y1 */
proc arima data=travel1; 
identify var=y1;
run;

/* ARIMA((1),1,0) model for input series x1 */
proc arima data=travel1; 
identify var=x1; 
estimate p=(1) plot;
run;

/* ARIMA(0,1,(1)) model for input series x1 */
proc arima data=travel1; 
identify var=x1; 
estimate q=(1) plot;
run;

/* ARIMA((1),1,(1)) model for input series x1 */
proc arima data=travel1; 
identify var=x1; 
estimate p=(1) q=(1) plot;
run;

/* Determine (b, r, s) values through prewhitening */
proc arima data=travel1; 
identify var=y1 crosscorr=x1; 
run;

/* Noise series identification and parameter estimation for (b=0, r=2, s=1) */
proc arima data=travel1;
identify var=y1 crosscorr=x1;
estimate p=1 q=1 input=(0$(1)/(1 2)x1) noconstant plot;
run;

/* Noise series identification and parameter estimation for (b=0, r=1, s=1) */
proc arima data=travel1;
identify var=y1 crosscorr=x1;
estimate p=1 q=1 input=(0$(1)/(1)x1) noconstant plot;
run;

/* Noise series identification and parameter estimation for (b=0, r=0, s=1) */
proc arima data=travel1;
identify var=y1 crosscorr=x1;
estimate p=1 q=1 input=(0$(1)/(0)x1) noconstant plot;
run;
