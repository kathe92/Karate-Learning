Feature: To test the delete end
  DELETE /normal/webapi/remove/{id}

  Background: Create and initialize base URL
    Given url 'http://localhost:9897/'

  Scenario: To delete the job entry from application using job id 
    #Create a new job entry
    #Using the patch request update the job description of newly added job entry
    * def getRandomValue = function() { return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Delete request
    Given path '/normal/webapi/remove/' + createJobId
    And headers { Accept : 'application/json'}
    When method delete
    Then status 200
    #Get request
    Given path '/normal/webapi/find'
    And params { id : '#(createJobId)', jobTitle : "Software Engg - 2" }
    And headers { Accept : 'application/json'}
    When method get
    Then status 404
    
    
   Scenario: To delete the job entry from application using job id and delete the job entry twice
    #Create a new job entry
    #Using the patch request update the job description of newly added job entry
    * def getRandomValue = function() { return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Delete request
    Given path '/normal/webapi/remove/' + createJobId
    And headers { Accept : 'application/json'}
    When method delete
    Then status 200
    #Delete request
    Given path '/normal/webapi/remove/' + createJobId
    And headers { Accept : 'application/json'}
    When method delete
    Then status 404
    
    
   Scenario: To demo request chaining
    #Create a new job entry
    #Extract the job id and job title from the response of POST request
    #Send the path request, value of query parameter will be set by, info extracted from previous request
    #Extract the job id and job title from the response of patch request
    #Get request with query parameter, value of is set by info extracted from response of patch request
    #Add the validation on job description in the response of get request
    * def getRandomValue = function() { return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    * def jobId = createJob.responseJobId
    * def jobTitle = createJob.responseJobTitle
    
    #Patch request
    * def jobDes = 'To develop android application and web application'
    Given path '/normal/webapi/update/details'
    And params {id: '#(jobId)', jobTitle: '#(jobTitle)', jobDescription: '#(jobDes)'}
    And headers { Accept : 'application/json'}
    And request {}
    When method patch
    Then status 200
    * def jobId = response.jobId
    * def jobTitle = response.jobTitle
    
    #Get Request
    Given path '/normal/webapi/find'
    And params { id : '#(jobId)', jobTitle : '#(jobTitle)' }
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.jobDescription == jobDes
    
    
    