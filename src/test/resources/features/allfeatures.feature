#Feature: Login on page
#
#  Background:
#    Given the url is "http://localhost/login.php"
#    When i fill the input login with "bee"
#    And i fill the input password with "bug"
#    Then the url is "http://localhost/portal.php"
#
#  Scenario: Successful login
#    Given the url is "http://localhost/login.php"
#    Then the url is "http://localhost/portal.php"
#
#  Scenario Outline: Unsuccessful login
#    Given the url is "http://localhost/login.php"
#    When i fill the input login with "<login>"
#    And i fill the input password with "<password>"
#    Then the url is "http://localhost/login.php"
#
#    Examples:
#      | login  | password |
#      | bee    | forge    |
#      | blabla | bee      |
#      | toto   | buzz     |
#
#Feature: Logout
#
#  Background:
#    Given the url is "http://localhost/login.php"
#    When i fill the input login with "bee"
#    And i fill the input password with "bug"
#    Then the url is "http://localhost/portal.php"
#
#  Scenario: Log out
#    When clicking on the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[8]/a"
#    Then the url is "http://localhost/login.php"
#
#Feature: Modify level of security
#
#  Background:
#    Given the url is "http://localhost/login.php"
#    When i fill the input login with "bee"
#    And i fill the input password with "bug"
#    Then the url is "http://localhost/portal.php"
#
#  Scenario Outline: Modify the level of security
#    When clicking on the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[4]/a"
#    Then the url is "http://localhost/security_level_set.php"
#    And i select an option from the dropdown "<level>"
#    When clicking on the tag with the xpath "/html/body/div[2]/form/p/button"
#    Then the url is "http://localhost/security_level_set.php"
#
#    Examples:
#      | level  |
#      | low    |
#      | medium |
#
#Feature: Reset Password
#
#  Background:
#    Given the url is "http://localhost/login.php"
#    When i fill the input login with "bee"
#    And i fill the input password with "bug"
#    Then the url is "http://localhost/portal.php"
#
#  Scenario: Reset password
#    And the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[2]/a" exists
#    When clicking on the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[2]/a"
#    Then the url is "http://localhost/password_change.php"
#    When i fill the input "current password" with "bug"
#    And i fill the input "password_new" with "pass"
#    And i fill the input "password_conf" with "pass"
#    When clicking on the tag with the xpath "/html/body/div[2]/form/button"
#    Then the url is "http://localhost/password_change.php"
