Feature: Reset Password
  Scenario: Enter login and password, successful and redirect to portal
    Given the url is "http://localhost/login.php"
    When i fill the input login with "bee"
    And i fill the int "password" with "bug"
    Then the url is http://localhost/portal.php
    When i click on the tag "/html/body/div[1]/table/tbody/tr/td[2]"
    Then the url is http://localhost/password_change.php
    When i fill the input "current password" with "bug"
    When i fill the input "password_new" with "pass"
    When i fill the input "password_conf" with "pass"
    Then i click on the tag "/html/body/div[2]/form/button"