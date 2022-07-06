Feature: To test the patch end for updating the job description
  PATCH /normal/webapi/update/details

  Background: Create and initialize base URL
    Given url 'http://localhost:9897/'

  Scenario: To update the job description for newly added job entry
    #Create a new job entry
    #Using the patch request update the job description of newly added job entry
    * def getRandomValue = function() { return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Patch request
    * def jobDes = 'To develop android application and web application'
    Given path '/normal/webapi/update/details'
    And params { id : '#(createJobId)', jobTitle : "Software Engg - 2", jobDescription: '#(jobDes)' }
    And headers { Accept : 'application/json'}
    When method patch
    Then status 200
    And match response.jobDescription == jobDes

  Scenario: To update the job description for newly added job entry with not-existing jobId
    #Create a new job entry
    #Using the patch request update the job description of newly added job entry
    * def getRandomValue = function() { return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Patch request
    * def jobDes = 'To develop android application and web application'
    Given path '/normal/webapi/update/details'
    And params { id : -1, jobTitle : "Software Engg - 2", jobDescription: '#(jobDes)' }
    And headers { Accept : 'application/json'}
    And request {}
    When method patch
    Then status 404

  Scenario: To update the job description for newly added job entry without jobTitle
    #Create a new job entry
    #Using the patch request update the job description of newly added job entry
    * def getRandomValue = function() { return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Patch request
    * def jobDes = 'To develop android application and web application'
    Given path '/normal/webapi/update/details'
    And params { id : '#(createJobId)', jobDescription: '#(jobDes)' }
    And headers { Accept : 'application/json'}
    And request {}
    When method patch
    Then status 400
    And match response.message == "Required String parameter 'jobTitle' is not present"
