Feature: Login on page
  Scenario: Enter login and password, successful and redirect to portal
    Given the url is "http://localhost/login.php"
    When i fill the input login with "bee"
    When i fill the input password with "bug"
    Then the url is "http://localhost/portal.php"

  Scenario Outline: Enter login and password, unsuccessful and redirect to login page
    Given the url is "http://localhost/login.php"
    When i fill the input login with "<login>"
    And i fill the input password with "<password>"
    Then the url is "http://localhost/login.php"

    Examples:
      | login  | password |
      | bee    | forge    |
      | blabla | bee      |
      | toto   | buzz     |

