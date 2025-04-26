Feature: Go on the blog page

  Background:
    Given the url is "http://localhost/login.php"
    When i fill the input login with "bee"
    And i fill the input password with "bug"
    Then the url is "http://localhost/portal.php"

  Scenario: Successful login with valid credentials
    Then the url is "http://localhost/portal.php"

  Scenario: Click on link to go to the blog page, new tab
    When clicking on the tag with the xpath "/html/body/div[1]/table/tbody/tr/td[7]/a"
    And switching to the new tab
    Then the url is "http://itsecgames.blogspot.com/"