proc means data = work.kimochimart_sorted
	n mean max min Q1 median Q3 std;

	var Sales;
	/*lass Product Type;*/
	output out= work.kimochidatamart_summary;
quit;