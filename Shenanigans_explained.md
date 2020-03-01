All data is gathered via read.table() first: subject numbers, activities info, data itself and vector disambiguation.

Then for test and train separately all these rows are assembled, creating two full datasets with subjects, activities and measurements as columns.

From there only columns with str() and mean() on the end are selected in a hideous manner, procedure applied to both sets, then stiching them together into a superset; numbers for modes of operation are subsequently replaced with proper names.

Then this superset is melted, with subjects and activities as ids and all other columns as values. It is then cast into two sets, calculating average across variables, then two are stitched together, and an odd column 8 is removed.

It goes to the output, and there you have it.

