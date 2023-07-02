/* Generated Code (IMPORT) */
/* Source File: sales.csv */
/* Source Path: /home/u63318200/sasuser.v94/uts */
/* Code generated on: 4/2/23, 12:51 PM */

%web_drop_table(WORK.KimochiMart);


FILENAME REFFILE '/home/u63318200/sasuser.v94/uts/sales.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.KimochiMart;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.KimochiMart; RUN;


%web_open_table(WORK.KimochiMart);