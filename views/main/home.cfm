

<h1>Text Extractor</h1>


<form action="?" method="post">

<table class="table">
<thead>
	<tr>
		<th>Process</th>
		<th>File name</th>
		<th class="text-right">File size</th>
		<th class="text-right">Modify date</th>
	</tr>
</thead>

<cfoutput query="rc.qryDirectory">
	<tr>
		<td><input type="radio" name="fileToProcess" value="#name.EncodeForHTMLAttribute()#" <cfif name EQ rc.fileToProcess>checked="checked"</cfif> /></td>
		<td><code>#name#</code></td>
		<td class="text-right">#LSNumberFormat(size \ 1024)# KB</b:td>
		<td class="text-right">#LSDateFormat(datelastmodified)#</b:td>
	</tr>
</cfoutput>
</table>

<button type="submit" class="btn btn-lg">Run</button>


<p>&nbsp;</p>

<h2>Results</h2>


<cfoutput>
	<code id="result">#SerializeJSON(rc.results)#</code>
</cfoutput>
