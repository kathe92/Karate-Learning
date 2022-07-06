Feature: To create the job entrey in the test application
  Helper file for Post /norml/webapi/add
  
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
