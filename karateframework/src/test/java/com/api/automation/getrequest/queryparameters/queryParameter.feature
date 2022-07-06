Feature: To test the get end point with query parameter
  Get /normal/webapi/find
  
  Background: Create and initialize base URL
  	Given url 'http://localhost:9897/'

  Scenario: To get the data using query parameter
    # Create the job entry
    #Get the newly created job entry using query parameter
    * def getRandomValue = function() { return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../../createJobEntryWithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Send the Get request with query param
    Given path '/normal/webapi/find'
    And params { id : '#(createJobId)', jobTitle : "Software Engg - 2" }
    And headers { Accept : 'application/json'}
    When method get
    Then status 200
    And match response.jobId == createJobId
    
  Scenario: To get the data using query parameter with jobId not in the application
    # Create the job entry
    #Get the newly created job entry using query parameter
    * def getRandomValue = function() { return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../../createJobEntryWithVariables.feature") {_url:'http://localhost:9897/', _path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Send the Get request with query param
    Given path '/normal/webapi/find'
    And param id = 78990394
    And param jobTitle = "Software Engg - 2" 
    And headers { Accept : 'application/json'}
    When method get
    Then status 404
		