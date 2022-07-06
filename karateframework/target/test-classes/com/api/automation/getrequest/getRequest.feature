Feature: To test the get end point of the application
To test different get end point with different data formated supported by the application

Background: Setup the Base Path
Given url 'http://localhost:9897'
And print ' ============== This is Background Keyword =================  '

Scenario: To get all the data from application in JSON format
	#Given url 'http://localhost:9897/normal/webapi/all'
	Given path '/normal/webapi/all'
	When method get
	Then status 200
	
	
Scenario: To get all the data from application in JSON format using path variable
	#Given url 'http://localhost:9897'
	#And path '/normal/webapi/all'
	#Base Path + Context Path
	Given path '/normal/webapi/all'
	And header Accept = 'application/json'
	When method get
	Then status 200
	
	
Scenario: To get all the data from application in JSON format using path variable
	#Given url 'http://localhost:9897'
	#And path '/normal/webapi/all'
	#Base Path + Context Path
	Given path '/normal/webapi/all'
	And header Accept = 'application/xml'
	When method get
	Then status 200