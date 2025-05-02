Feature: Login on page
  Scenario: Enter login and password, successful and redirect to portal
    Given the url is "http://localhost/login.php"
    When i fill the input with the id "login" with "bee"
    When i fill the input with the id "password" with "bug"
    And the tag with the xpath "/html/body/div[2]/form/button" exists
    When clicking on the tag with the xpath "/html/body/div[2]/form/button"
    Then the url is "http://localhost/portal.php"

  Scenario Outline: Enter login and password, unsuccessful and redirect to login page
    Given the url is "http://localhost/login.php"
    When i fill the input with the id "login" with "<login>"
    When i fill the input with the id "password" with "<password>"
    And the tag with the xpath "/html/body/div[2]/form/button" exists
    When clicking on the tag with the xpath "/html/body/div[2]/form/button"
    Then the url is "http://localhost/login.php"

    Examples:
      | login  | password |
      | bee    | forge    |
      | blabla | bee      |
      | toto   | buzz     |

