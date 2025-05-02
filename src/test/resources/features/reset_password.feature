Feature: Reset Password

  Background:
    Given the url is "http://localhost/login.php"
    When i fill the input with the id "login" with "bee"
    When i fill the input with the id "password" with "bug"
    And the tag with the xpath "/html/body/div[2]/form/button" exists
    When clicking on the tag with the xpath "/html/body/div[2]/form/button"
    Then the url is "http://localhost/portal.php"

  Scenario: Successful login with valid credentials
    Then the url is "http://localhost/portal.php"

  Scenario: Go to the reset page, fill the inputs, and validate the change
    And the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[2]/a" exists
    When clicking on the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[2]/a"
    Then the url is "http://localhost/password_change.php"
    When i fill the input with the id "password_curr" with "bug"
    When i fill the input with the id "password_new" with "pass"
    When i fill the input with the id "password_conf" with "pass"
    And the tag with the xpath "/html/body/div[2]/form/button" exists
    When clicking on the tag with the xpath "/html/body/div[2]/form/button"
    Then the url is "http://localhost/password_change.php"

#After this command, need to reset the id for login. The login background is no more accurate and usable.