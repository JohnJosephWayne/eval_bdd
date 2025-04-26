package steps;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.Objects;

public class MyStepDefs {

    WebDriver driver = Hooks.driver;

    @Given("the url is {string}")
    public void theUrlIs(String url) {
        if (driver == null) {
            throw new IllegalStateException("WebDriver has not been initialized!");
        }
        driver.get(url);
        Assert.assertEquals("URL mismatch!", url, driver.getCurrentUrl());
    }

    @When("i fill the input login with {string}")
    public void iFillTheInputLoginWith(String log) {
        WebElement usernameField = driver.findElement(By.id("login"));
        usernameField.clear();
        usernameField.sendKeys(log);
        Assert.assertEquals("Login field value mismatch!", log, usernameField.getAttribute("value"));

    }

    @When("i fill the input password with {string}")
    public void iFillTheInputPasswordWith(String password) {
        WebElement passwordField = driver.findElement(By.id("password"));
        passwordField.clear();
        passwordField.sendKeys(password);
        Assert.assertEquals("Password field value mismatch!", password, passwordField.getAttribute("value"));

        // Clique sur le bouton de connexion
        WebElement loginButton = driver.findElement(By.xpath("/html/body/div[2]/form/button"));
        loginButton.click();

        // Attends que l'URL change
        new WebDriverWait(driver, Duration.ofMillis(300))
                .until(ExpectedConditions.or(
                        ExpectedConditions.urlContains("/portal.php"),
                        ExpectedConditions.urlContains("/login.php")
                ));
    }


    @When("clicking on the tag with the xpath {string}")
    public void clickingOnTheTagWithTheXpath(String xpath) {
        WebElement element = driver.findElement(By.xpath(xpath));
        Assert.assertTrue("Element with xpath '" + xpath + "' is not displayed.", element.isDisplayed());
        Assert.assertTrue("Button with xpath '" + xpath + "' is not clickable.", element.isEnabled());
        element.click();

        if (Objects.equals(xpath, "/html/body/div[1]/table/tbody/tr/td[8]/a")) {
            Alert alert = driver.switchTo().alert();
            alert.accept();
            driver.get("http://localhost/login.php");
        }

    }


    @And("the tag with the xpath {string} exists")
    public void theTagWithTheXpathExist(String xpath) {
        WebElement element = driver.findElement(By.xpath(xpath));
        Assert.assertTrue("The element with the given XPath does not exist or is not visible.", element.isDisplayed());
    }

    @And("i select an option from the dropdown {string}")
    public void selectAnOptionFromTheDropdownLevel(String level) {
        WebElement selectElement = driver.findElement(By.xpath("//select"));
        Select dropdown = new Select(selectElement);
        dropdown.selectByVisibleText(level);
    }

    @When("i fill the input with the id {string} with {string}")
    public void iFillTheInputWith(String inputId, String value) {
        WebElement inputField = driver.findElement(By.id(inputId));
        inputField.clear();
        inputField.sendKeys(value);
        Assert.assertEquals("Mismatch for input field with id: " + inputId, value, inputField.getAttribute("value"));
    }

    @And("switching to the new tab")
    public void switchingToTheNewTab() {
        String originalWindow = driver.getWindowHandle();

        WebElement element = driver.findElement(By.xpath("/html/body/div[1]/table/tbody/tr/td[7]/a"));
        Assert.assertTrue(element.isDisplayed());
        element.click();

        // Si l'action ouvre un nouvel onglet
        new WebDriverWait(driver, Duration.ofSeconds(5))
                .until(driver -> driver.getWindowHandles().size() > 1);

        for (String windowHandle : driver.getWindowHandles()) {
            if (!windowHandle.equals(originalWindow)) {
                driver.switchTo().window(windowHandle);
                break;
            }
        }
    }

    @And("check the box")
    public void checkTheBox() {
        WebElement checkbox = driver.findElement(By.id("mail_activation"));
        if (checkbox.isSelected()) {
            checkbox.click(); // the checkbox doesn't be selected to add a user
        }
    }
    @Then("i see the confirmation message {string}")
    public void iSeeTheConfirmationMessage(String expectedMessage) {
        WebElement messageElement = driver.findElement(By.xpath("/html/body/div[2]/font"));
        String actualMessage = messageElement.getText();
        Assert.assertEquals("Confirmation message mismatch!", expectedMessage, actualMessage);
    }

}
