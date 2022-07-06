Feature: To validate the GET End point
	To validate the get end point response
	
	Background: Setup the base url
		Given url 'http://localhost:9897'
		
	Scenario: To get the data in JSON format
		Given path '/normal/webapi/all'
		And header Accept = 'application/json'
		When method get
		Then status 200 
		And match response.[0].jobId == 1
		And match response.[0].experience[1] == 'Apple'
		And match response.[0].project[0].projectName == 'Movie App'
		And match response.[0].project[0].technology[2] == 'Gradle'
		#Validate the size of array
		And match response.[0].experience == '#[3]'
		And match response.[0].project[0].technology == '#[3]'
		#Using wild card char
		And match response.[0].experience[*] contains ["Apple","Mobile Iron"]
		And match response.[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
		And match response.[*].jobId contains 1
		
	Scenario: To get the data in JSON format and validate using fuzzy matcher
		Given path '/normal/webapi/all'
		And header Accept = 'application/json'
		When method get
		Then status 200 
		And match response.[0].jobId == '#present'
		And match response.[0].experience[1] == '#notnull'
		And match response.[0].project[0].projectName == '#ignore'
		And match response.[0].project[0].technology == '#array'
		And match response.[0].jobTitle == '#string'
		And match response.[0].jobId == '#number'
		#Complex fuzzy matcher
		And match response.[0].jobId == '#? _ ==1'
		And match response.[0].jobTitle == '#string? _.length >=1'
				