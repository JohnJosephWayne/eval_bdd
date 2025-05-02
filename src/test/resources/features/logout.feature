Feature: Logout

  Background:
    Given the url is "http://localhost/login.php"
    When i fill the input with the id "login" with "bee"
    When i fill the input with the id "password" with "bug"
    And the tag with the xpath "/html/body/div[2]/form/button" exists
    When clicking on the tag with the xpath "/html/body/div[2]/form/button"
    Then the url is "http://localhost/portal.php"

  Scenario: Successful login with valid credentials
    Then the url is "http://localhost/portal.php"

  Scenario: Log out
    And the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[8]/a" exists
    When clicking on the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[8]/a"
    Then the url is "http://localhost/login.php"
