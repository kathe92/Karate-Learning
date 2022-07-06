Feature: To create the Job entry in the application
	Use POST /normal/webapi/add to create a job entry in the application
	
	Background: Setup the base url
		Given url 'http://localhost:9897'
		
	@Regression
	Scenario: To create the job entry in JSON format
		Given path '/normal/webapi/add'
		And request { "jobId": 3, "jobTitle": "Software Engg - 3", "jobDescription": "To develop andriod application", "experience": [ "Google", "Apple", "Pega" ], "project": [ { "projectName": "Movie App", "technology": [ "SQL Lite", "Gradle" ] } ] }
		And headers { Accept : 'application/json', Content-Type : 'application/json' }
		When method post
		Then status 201 
		And print response
		And match response.jobTitle == "Software Engg - 3"
		
		
	Scenario: To create the job entry in JSON format
		Given path '/normal/webapi/add'
		* def body = read('/data/jobEntry.json')
		And request body
		And headers { Accept : 'application/json', Content-Type : 'application/json' }
		When method post
		Then status 201 
		And print response
		And match response.jobId == 4
		
	Scenario: To create the job entry in JSON format
		Given path '/normal/webapi/add'
		* def body = read('/data/jobEntry.xml')
		And request body
		And headers { Accept : 'application/xml', Content-Type : 'application/xml' }
		When method post
		Then status 201 
		And print response
		And match response/Job/jobTitle == "Devops 6"
