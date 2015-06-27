# DCshotspot
Some quick results from a little noodling about with the <a href="https://muckrock.s3.amazonaws.com/foia_files/WashingtonDC_Incidents_2006-2013_Raw_Data_2.xlsx">DC ShotSpotter data</a href>.

<b>Data preparation</b>

39065 events were recorded by the ShotSpotter system from Jan. 27, 2006 to Jun. 24, 2013.  The data was already nicely prepared in an Excel spreadsheet with columns for the DC Ward, timestamp, incident type (single or multiple gunshots), and coordinate information (accurate to 100 m) for each event.  Data was loaded into R.

Cuts were made for days that may be contributing potentially spurious data attributable to <a href="http://www.washingtonpost.com/wp-srv/special/local/dc-shot-spotter/">false positives</a href> (fireworks and celebratory gunfire on Dec. 31 - Jan. 1 and Jul. 3 - Jul. 5 ).

The remaining 27230 events should represent, fairly accurately, gunshots detected in the wards that were monitored by the ShotSpotter.  Due to the targeted ShotSpotter coverage, I settled in on exploring variables that are, essentially, independent of location: incidents as a function of month and time of day.

The data was sorted into twelve data frames corresponding to the month that each event took place in.  Histograms binned by time of day (quarter-hour bins) were prepared for each of the months.

<b>Data presentation</b>

The data was arranged in a calendar-style form using <a href="https://github.com/ateucher">Andy Teucher's</a href> modified version of <a href="https://github.com/ateucher/useful_code/blob/master/R/multiplot.r">multiplot.R</a href>.

<img src="http://i.imgur.com/Y8EHmA7.jpg">

<b>Conclusions</b>

The month to month comparisons are slightly biased due to the start and end points of the data set (~2/06 to ~7/13), but I do not believe the effect to impact the qualitative conclusion much - June and July are particularly active months.  This matches well with anecdotal accounts in <a href="http://www.nytimes.com/2013/09/01/opinion/sunday/weather-and-violence.html?_r=0">popular media</a href>.

Also quickly apparent is the repeatable shape of the histograms.  It seems very likely that this is attributable to the fact that it is a particularly poor idea to open fire in broad daylight.  I have shaded the bars corresponding to the average daylight period for each month (as gathered from any number of daylight calculator websites), which does seem to account for the monthly variation (i.e. shifting and widening/shrinking) in the period of time in which gunshots are most frequent.
