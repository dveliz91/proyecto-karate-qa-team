Feature: Registro Usuario

  @automation-api-register
  Scenario: Test 01 - Registro OK
    Given url urlBase
    And path urlRegister
    When request {"email": "proyecto-final5@gmail.com","password": "pruebas1*","nombre": "Proyecto", "tipo_usuario_id":"1", "estado":"1"}
    And method POST
    Then status 200
    And match response.access_token != null
    And match response.token_type == "Bearer"
    And match response.data != null
    * print response

  Scenario: Test 02 - Registro ERROR
    Given url urlBase
    And path urlRegister
    When request {"email": "proyecto-final10@gmail.com","password": "pruebas","nombre": "Proyecto", "tipo_usuario_id":"1", "estado":"1"}
    And method POST
    Then status 500
    And match response.password != null
    * print response

  Scenario: Test 03 - Registro Duplicado
    Given url urlBase
    And path urlRegister
    When request {"email": "proyecto-final1@gmail.com","password": "pruebas*","nombre": "Proyecto", "tipo_usuario_id":"1", "estado":"1"}
    And method POST
    Then status 500
    And match response.email != null
    * print response