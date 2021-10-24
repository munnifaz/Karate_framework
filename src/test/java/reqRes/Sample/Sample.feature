Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url base_url


  Scenario: get all users and then get the first user by id
    Given path 'users'
    When method get
    Then status 200

    * def first = response.data[0]

    Given path 'users', first.id
    When method get
    Then status 200
    #do equals validation like first name , last name
    #check if avatar key is present in json
    Then print first
    And match first contains {'avatar': '#present'}
    And match first.id == "#number"
    And match first.first_name == "#string"


  @GETALL
    Scenario: verify all the users
    Given path 'users'
    When method GET
    Then status 200
    * print response
    * def names = ["George"]
    And match $..first_name contains names



  @POST1
  Scenario: create a user and then get it by name
    * def user =
      """
      {
    "name": "morpheus",
    "job": "leader"
}
      """

    Given path 'users'
    And request user
    When method post
    Then status 201

    Then print response

    * def name = response.name
    * print 'created name is: ', name

        #verify if id is not null


  @GETALL
  Scenario Outline: Update a user and then verify by any updated field name
    * def user =
      """
      {
    "name": "<username>",
    "job": "<job>"
}
      """

    Given path 'users/2'
    And request user
    When method PUT
    Then status 200

    * print response
    * def name = '<username>'
    * match response contains {'name' : #(name)}
    * match response.name == name
    * match response.job == '<job>'
          #job
  Examples:
    |username|job|
    |Munni   |CS |
    |Second  |MS |

  @DELETE
  Scenario: Delete a user and verify the user has been deleted.

    Given path 'users/2'
    When method DELETE
    Then status 204

    And match response == ''

    Given path 'users/2'
    When method GET
    Then status 200

