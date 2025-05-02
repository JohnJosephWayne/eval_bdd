Feature: Go on the blog page

  Background:
    Given the url is "http://localhost/login.php"
    When i fill the input with the id "login" with "bee"
    When i fill the input with the id "password" with "bug"
    And the tag with the xpath "/html/body/div[2]/form/button" exists
    When clicking on the tag with the xpath "/html/body/div[2]/form/button"
    Then the url is "http://localhost/portal.php"

  Scenario: Successful login with valid credentials
    Then the url is "http://localhost/portal.php"

  Scenario: Click on link to go to the blog page, new tab
    And the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[7]/a" exists
    When clicking on the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[7]/a"
    And switching to the new tab
    Then the url is "http://itsecgames.blogspot.com/"