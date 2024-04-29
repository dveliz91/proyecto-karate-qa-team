Feature: Creacion de Productos
  Background:
    * def responseLogin = call read("classpath:bdd/auth/loginAuth.feature@login")
    * def token = responseLogin.token
    * url urlBase
    * header Authorization = 'Bearer ' + token
    * header Accept = "application/json"

    @automation-api-crear-producto

    Scenario Outline: Test 01 - Creacion Producto OK
        * def body =
       """
          {
          "codigo": "<CODIGO>",
          "nombre": "<NOMBRE>",
          "medida": "<MEDIDA>",
          "marca": "<MARCA>",
          "categoria": "<CATEGORIA>",
          "precio":"<PRECIO>",
          "stock": "<STOCK>",
          "estado": "<ESTADO>",
          "descripcion": "<DESCRIPCION>"}
       """
        Given url urlBase
        And path urlProducto
        When request body
        And method POST
        Then status 200
        Examples:
            |CODIGO|NOMBRE|MEDIDA|MARCA|CATEGORIA|PRECIO|STOCK|ESTADO|DESCRIPCION|
            |TC208|ALTERNADOR PL200NS|UND|Generico|Repuestos|35.00|48|3|ALTERNADOR PL200NS|

    Scenario: Test 02 - Creacion Producto OK
    * def body = read('classpath:resources/json/auth/bodyLogin.json')
    Given url urlBase
    And path urlProducto
    And request body
    When method post
    Then status 200
      And match response.codigo != null
      * print response

  Scenario: Test 03 - Creacion Producto Error
    Given url urlBase
    And path urlProducto
    And request body
    When method post
    Then status 500
    And match response.error != null
    * print response

  Scenario: Test 04 - Creacion Producto Error
    Given url urlBase
    And path urlProducto
    And request { "codigo": "TC2011","nombre": "ALTERNADOR PL200NS","medida": "UND","marca": "Generico","categoria": "Repuestos","precio": "precio","stock": "stock","estado": "3","descripcion": "ALTERNADOR PL200NS"}
    When method post
    Then status 500
    And match response.precio != null
    And match response.stock != null
    * print response