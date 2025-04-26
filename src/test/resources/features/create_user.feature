Feature: Create User

  Background:
    Given the url is "http://localhost/login.php"
    When i fill the input login with "bee"
    And i fill the input password with "bug"
    Then the url is "http://localhost/portal.php"

  Scenario: Successful login with valid credentials
    Then the url is "http://localhost/portal.php"

  Scenario: Click on link to go to the create user page, fill the inputs and submit
    When clicking on the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[3]/a"
    When i fill the input with the id "login" with "root"
    And i fill the input with the id "email" with "riney57999@hedotu.com"
    And i fill the input with the id "password" with "root"
    And i fill the input with the id "password_conf" with "root"
    And i fill the input with the id "secret" with "root"
    And check the box
    And clicking on the tag with the xpath "/html/body/div[2]/form/button"
    Then i see the confirmation message "User successfully created!"
    Then the url is "http://localhost/portal.php"

#It works one time for one user
