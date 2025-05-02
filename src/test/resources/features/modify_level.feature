Feature: Modify level of security

  Background:
    Given the url is "http://localhost/login.php"
    When i fill the input with the id "login" with "bee"
    When i fill the input with the id "password" with "bug"
    And the tag with the xpath "/html/body/div[2]/form/button" exists
    When clicking on the tag with the xpath "/html/body/div[2]/form/button"
    Then the url is "http://localhost/portal.php"

  Scenario: Successful login with valid credentials
    Then the url is "http://localhost/portal.php"

  Scenario Outline: Log in and modify the level of security
    And the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[4]/a" exists
    When clicking on the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[4]/a"
    Then the url is "http://localhost/security_level_set.php"
    And the tag with the xpath "/html/body/div[2]/form/p/select" exists
    When clicking on the tag with the xpath "/html/body/div[2]/form/p/select"
    And i select an option from the dropdown "<level>"
    And the tag with the xpath "/html/body/div[2]/form/p/button" exists
    When clicking on the tag with the xpath "/html/body/div[2]/form/p/button"
    Then the url is "http://localhost/security_level_set.php"

    Examples:
      | level  |
      | low    |
      | medium |

