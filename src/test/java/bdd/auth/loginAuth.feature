Feature: Login

  @login
  Scenario: Test 01 - Login OK
    Given url urlBase
    And path urlLogin
    And request { "email": "dveliz_91@hotmail.com", "password": "09876544321"}
    When method post
    Then status 200
    And match response.access_token != null
    * def token = response.access_token
    * print response

  Scenario: Test 02 - Login OK
    Given url urlBase
    And path urlLogin
    And form field email = "dveliz_91@hotmail.com"
    And form field password = "09876544321"
    When method post
    Then status 200
    And match response.access_token != null
    And match response.token_type == "Bearer"
    * print response

  Scenario: Test 03 - Login ERROR
    Given url urlBase
    And path urlLogin
    And request { "email": "dveliz@gmail.com", "password": "09876544321"}
    When method post
    Then status 401
    And match response.message == "Datos incorrectos"
    * print response

