Feature: Create User

  Background:
    Given the url is "http://localhost/login.php"
    When i fill the input with the id "login" with "bee"
    When i fill the input with the id "password" with "bug"
    And the tag with the xpath "/html/body/div[2]/form/button" exists
    When clicking on the tag with the xpath "/html/body/div[2]/form/button"
    Then the url is "http://localhost/portal.php"

  Scenario: Successful login with valid credentials
    Then the url is "http://localhost/portal.php"

  Scenario: Click on link to go to the create user page, fill the inputs and submit
    And the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[3]/a" exists
    When clicking on the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[3]/a"
    When i fill the input with the id "login" with "root"
    And i fill the input with the id "email" with "riney57999@hedotu.com"
    And i fill the input with the id "password" with "root"
    And i fill the input with the id "password_conf" with "root"
    And i fill the input with the id "secret" with "root"
    And check the box
    And the tag with the xpath "/html/body/div[2]/form/button" exists
    And clicking on the tag with the xpath "/html/body/div[2]/form/button"
    Then i see the confirmation message "User successfully created!"
    Then the url is "http://localhost/portal.php"

#It works one time for one user
