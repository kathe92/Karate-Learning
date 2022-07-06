Feature: To create the Job entry in the application
	Use POST /normal/webapi/add to create a job entry in the application
	
	Background: Setup the base url
		Given url 'http://localhost:9897'
		
	Scenario: To create the job entry in JSON format
		Given path '/normal/webapi/add'
		* def body = read('/data/jobEntry.json')
		And request body
		And headers { Accept : 'application/json', Content-Type : 'application/json' }
		When method post
		Then status 201 
		And match response == 
		"""
		{ 
			"jobId": '#number', 
			"jobTitle": '#string', 
			"jobDescription":  '#string', 
			"experience": '#[]  #string', 
			"project": '#[]  #object', 
		}
		"""
	
