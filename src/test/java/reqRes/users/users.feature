Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url base_url
    And header Authorization = access_token

    @GET
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
      And match first == {first_name: "#present" , 'id': '#ignore' , 'email':'#ignore' , 'last_name':'#ignore' , 'avatar':'#ignore'}

      @POST
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
     And  match response.id == "##notnull"

    * def name = response.name
    * print 'created name is: ', name

        #verify if id is not null


        @PUT
    Scenario: Update a user and then verify by any updated field name
      * def user =
      """
      {
    "name": "Munni",
    "job": "leader"
}
      """

      Given path 'users/2'
      And request user
      When method PUT
      Then status 200

      * print response

      * match response.name == 'Munni'
          And match response.job == "leader"
          #job

          @DELETE
      Scenario: Delete a user and verify the user has been deleted.

        Given path 'users/2'
        When method DELETE
        Then status 204

        And match response == ''

        Given path 'users/2'
        When method GET
        Then status 200






