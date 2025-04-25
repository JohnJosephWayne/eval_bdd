Feature: Logout
  Scenario: I connect then i log out
    Given the url is "http://localhost/login.php"
    When user fill the input login with "bee"
    And user fill the int "password" with "bug"
    Then the url is http://localhost/portal.php
    Then user log out
    Then the url is "http://localhost/login.php"
