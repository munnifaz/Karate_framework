@regression
Feature: Testing Util Methods

Scenario Outline: generate a random string
  * def random = Java.type("util.RandomString")
  * def value = random.generateRandomAlphaNumeric(10)
  * print value


  * def config = { host: 'localhost', port: 3306, db: 'employee', user: 'root', pswd: ''}

  * def query = 'SELECT * FROM users'

  * def results = Java.type('util.DBConnector').getData(config, query)


  * print results

  And match results[1]["1"] == '<fname>'
  And match results[1]["2"] == '<lname>'
  And match results[1]["3"] == '<role>'
  And match results[1]["4"] == '<number>'

  Examples:
  |fname|lname|role|number|
  |Munni|Shaik|Test Analyst|1234567890|