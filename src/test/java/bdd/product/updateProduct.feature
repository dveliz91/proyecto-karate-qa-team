Feature: Actualizacion de Productos
  Background:
    * def responseLogin = call read("classpath:bdd/auth/loginAuth.feature@login")
    * def token = responseLogin.token
    * url urlBase
    * header Authorization = 'Bearer ' + token
    * header Accept = "application/json"

  @automation-api-actualizar-producto
  Scenario: Test 01 - Actualizar Producto OK
    * def body = read('classpath:resources/json/auth/bodyLogin.json')
    * def id = 2
    And path urlProducto +'/'+ id
    And request body
    When method put
    Then status 200
    * print response

  Scenario: Test 02 - Actualizar Producto ERROR
    * def body = read('classpath:resources/json/auth/bodyLogin.json')
    * def id = 1000
    And path urlProducto +'/'+ id
    And request body
    When method put
    Then status 500
    And match response.error == "Call to a member function update() on null"
    * print response