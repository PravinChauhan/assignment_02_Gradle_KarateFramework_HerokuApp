Feature:Create A Restful Booker For HerokuApp

  Background: url service
    * url 'https://restful-booker.herokuapp.com/'
    * def authToken = call read('classpath:features/token/createToken.feature@CreateToken')

  @Create
  Scenario: Create Restful Booker HerokuApp
    Given path 'booking'
    Given header Accept = 'application/json'
    And request read ('classpath:features/create/body.json')
    When method POST
    Then status 200
    And match response.[*].firstname == "#present", "#string", "#notnull"
    And match response.[*].lastname == "#present", "#string", "#notnull"
    And def id = response.bookingid
    And print id
    And print 'createResponse: ', response
