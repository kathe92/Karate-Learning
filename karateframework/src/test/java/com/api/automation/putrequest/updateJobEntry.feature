Feature: To test the updation of Job entry in the test application
  Test the end point PUT /normal/webapi/update

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: To update the job entry in JSON format
    Given path '/normal/webapi/add'
    * def getRandomValue = function() { return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request { "jobId": '#(id)', "jobTitle": "Software Engg - 13", "jobDescription": "To develop andriod application", "experience": [ "Google", "Apple", "Pega" ], "project": [ { "projectName": "Movie App", "technology": [ "SQL Lite", "Gradle" ] } ] }
    And headers { Accept : 'application/json', Content-Type : 'application/json' }
    When method post
    Then status 201
    #Put request
    Given path '/normal/webapi/update'
    And request
      """
      {
            "jobId": '#(id)',
            "jobTitle": "Software Eng",
            "jobDescription": "To develop android application and web application",
            "experience": [
                "Google",
                "Apple",
                "Mobile Iron"
            ],
            "project": [
                {
                    "projectName": "Movie App",
                    "technology": [
                        "Kotlin",
                        "SQL Lite",
                        "Gradle"
                    ]
                },
                {
                    "projectName": "Movie App Second",
                    "technology": [
                        "Kotlin",
                        "SQL Lite",
                        "Gradle",
                        "Jenkins"
                    ]
                }
            ]
        }
      """
    And headers { Accept : 'application/json', Content-Type : 'application/json' }
    When method put
		Then status 200
		* def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + id + ")].project")
		And print projectArray
		And match projectArray[0] == '#[2]'
		
		
		Scenario: To update the job entry for existing job in JSON format by calling another feature file
 		# <Gherkin keyword> <call> <read(<location of file>)>
 		Given call read("../createJobEntry.feature")
    #Put request
    Given path '/normal/webapi/update'
    And request
      """
      {
            "jobId": '125',
            "jobTitle": "Software Eng",
            "jobDescription": "To develop android application and web application",
            "experience": [
                "Google",
                "Apple",
                "Mobile Iron"
            ],
            "project": [
                {
                    "projectName": "Movie App",
                    "technology": [
                        "Kotlin",
                        "SQL Lite",
                        "Gradle"
                    ]
                },
                {
                    "projectName": "Movie App Second",
                    "technology": [
                        "Kotlin",
                        "SQL Lite",
                        "Gradle",
                        "Jenkins"
                    ]
                }
            ]
        }
      """
    And headers { Accept : 'application/json', Content-Type : 'application/json' }
    When method put
		Then status 200
		* def projectArray = karate.jsonPath(response, "$[?(@.jobId == 125)].project")
		And print projectArray
		And match projectArray[0] == '#[2]'
		
		
			Scenario: To update the job entry for existing job in JSON format by calling another feature file - accessing variables
 		# <Gherkin keyword> <call> <read(<location of file>)>
 		# Given call read("../createJobEntry.feature")
 		* def postRequest = call read("../createJobEntry.feature")
 		And print 'Calling Feature ==> ',  postRequest.id
 		And print 'Calling Feature ==> ',  postRequest.getRandomValue()
    #Put request
    Given path '/normal/webapi/update'
    And request
      """
      {
            "jobId": '#(postRequest.id)',
            "jobTitle": "Software Eng",
            "jobDescription": "To develop android application and web application",
            "experience": [
                "Google",
                "Apple",
                "Mobile Iron"
            ],
            "project": [
                {
                    "projectName": "Movie App",
                    "technology": [
                        "Kotlin",
                        "SQL Lite",
                        "Gradle"
                    ]
                },
                {
                    "projectName": "Movie App Second",
                    "technology": [
                        "Kotlin",
                        "SQL Lite",
                        "Gradle",
                        "Jenkins"
                    ]
                }
            ]
        }
      """
    And headers { Accept : 'application/json', Content-Type : 'application/json' }
    When method put
		Then status 200
		* def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + postRequest.id + ")].project")
		And print projectArray
		And match projectArray[0] == '#[2]'