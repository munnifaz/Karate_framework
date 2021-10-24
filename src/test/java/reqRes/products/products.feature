Feature: Testing Bigbasket


  Scenario Outline: To find name, price using id
    Given url 'https://gorest.co.in/public/v1/todos'
    When method GET
    Then status 200
    * print response

  #$..data[?(@.pid=='40001606')]

    * def fetchid = $..data[?(@.id == <id>)]
    * def links = response.meta.pagination.links
    * print links
    * print fetchid
    * print fetchid[0].due_on
    * match fetchid[0].due_on == "#regex [\\d]{4}\\-[\\d]{2}\\-[\\d]{2}T[\\d]{2}\\:[\\d]{2}\\:[\\d]{2}\\.[\\d]{3}\\+[\\d]{2}\\:[\\d]{2}"
    * match fetchid[0].title == "#regex ^Deduco.*.verbum.$"
    * match fetchid[0].user_id == "#regex [^a-zA-Z]+"
    #* match fetchpid.price == '<price>'


    Examples:
    |id|
    |99|



Scenario: Validate Response Schema
  * def productSchema = read("classpath:reqRes/products/ProductsResponseSchema.json")
  Given url 'https://gorest.co.in/public/v1/todos'
  When method GET
  Then status 200
  * print response
  And match $.meta == productSchema.meta
  And print response.meta
  And print productSchema.meta

  And match each $.data == productSchema.data[0]
  And match $.meta == productSchema.schema.meta
  And match $.data == productSchema.schema.data

  And match $.meta.pagination == "#object"



  @check
  Scenario Outline: Create a new user and verify the user
    * def requestUser = read("classpath:reqRes/products/userRequest.json")

    * requestUser.name = '<name>'
    * def random = Java.type("util.RandomString")
    * def email = random.generateRandomAlphaNumeric(10) + '@' + random.generateRandomAlphaNumeric(5) + '.com'
    * requestUser.email = email
    * requestUser.gender = '<gender>'

    * print requestUser

    Given url "https://gorest.co.in/public/v1/users"
    And header Authorization = access_token
    And header Content-Type = content_type
    And request requestUser
    When method POST
    Then status 201
    * print response

    * def id = response.data.id


    Given url 'https://gorest.co.in/public/v1/users'
    Given path id
    When method GET
    Then status 200
    * print response

    And match $.data.name == "<name>"
    And match $.data.email == email

    * def updatereq =
    """
    {
      "name": "JagadishaKhannaIV",
     "email": "jagadisha_khanna_iv@farrell.info",
       "status": "active"
       }
    """

    * updatereq.name = '<new_name>'

    Given url "https://gorest.co.in/public/v1/users/" + id
    And header Authorization = access_token
    And header Content-Type = content_type
    And request updatereq
    When method PUT
    Then status 200
    * print response
    * match $.data.name == '<new_name>'


    Given url "https://gorest.co.in/public/v1/users/" + id
    And header Authorization = access_token
    And header Content-Type = content_type
    When method DELETE
    Then status 204
    * print response
    When method GET
    Then status 404
    * print response
    And match $.data.message == "Resource not found"


    Examples:
      |name|gender|new_name|
      |xyz123|Female|jjvd|













