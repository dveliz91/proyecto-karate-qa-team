Feature: Listado de Productos

  Background:
    * def responseLogin = call read("classpath:bdd/auth/loginAuth.feature@login")
    * def token = responseLogin.token
    * url urlBase
    * header Authorization = 'Bearer ' + token
    * header Accept = "application/json"

  Scenario: Test 01 - Listado de Productos OK
  Given path urlProducto
    When method get
    Then status 200
    * print response

  Scenario: Test 02 - Listado de Productos OK
    * def id = 2
    And path urlProducto +'/'+ id
    When method get
    Then status 200
    And match response.id == id
    * print response