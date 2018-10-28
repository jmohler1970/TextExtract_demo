<cfscript>
component	accessors="true"  output="false" {

property	beanFactory;
property	framework;



void function before(required struct rc) output="false"	{

	rc.qryDirectory = directoryList(application.GSDATAPATH, false, "query");

	rc.results = [];
	}


void function home(required struct rc) output="false"	{

	param rc.fileToProcess = ""; // nothing has been picked yet

	if (cgi.request_method == "POST" && rc.keyExists("fileToProcess") && rc.fileToProcess != "")	{


		local.textExtract = new model.textExtract();

		if(!local.textExtract.setup(application.GSDATAPATH & rc.fileToProcess, [5,10,15,20]))	{
			rc.results.append(["Error: File could not be processed because it does not exist."]);
			};

		rc.results.append(local.textExtract.getNextLineTokens());
		rc.results.append(local.textExtract.getNextLineTokens());
		rc.results.append(local.textExtract.getNextLineTokens());
		} // end post

	} // end function

} // end component
</cfscript>
