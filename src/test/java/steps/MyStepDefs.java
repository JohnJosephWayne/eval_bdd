package steps;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.Objects;

import static org.junit.Assert.*;

public class MyStepDefs {

    WebDriver driver = Hooks.driver;

    @Given("the url is {string}")
    public void theUrlIs(String url) {
        if (driver == null) {
            throw new IllegalStateException("WebDriver has not been initialized!");
        }
        driver.get(url);
        assertEquals("URL mismatch!", url, driver.getCurrentUrl());
    }
    @When("i fill the input with the id {string} with {string}")
    public void iFillTheInputWith(String inputId, String value) {
        WebElement inputField = driver.findElement(By.id(inputId));
        inputField.clear();
        inputField.sendKeys(value);
        assertEquals("Mismatch for input field with id: " + inputId, value, inputField.getAttribute("value"));
    }

    @When("clicking on the tag with the xpath {string}")
    public void clickingOnTheTagWithTheXpath(String xpath) {
        WebElement element = driver.findElement(By.xpath(xpath));
        assertTrue("Element with xpath '" + xpath + "' is not displayed.", element.isDisplayed());
        assertTrue("Button with xpath '" + xpath + "' is not clickable.", element.isEnabled());
        element.click();

        if (Objects.equals(xpath, "/html/body/div[2]/form/button")) {
            Alert alert = driver.switchTo().alert();
            alert.accept();
            driver.get("http://localhost/portal.php");
        }
        if (Objects.equals(xpath, "/html/body/div[1]/table/tbody/tr/td[8]/a")) {
            Alert alert = driver.switchTo().alert();
            alert.accept();
            driver.get("http://localhost/login.php");
        }
    }

    @And("the tag with the xpath {string} exists")
    public void theTagWithTheXpathExist(String xpath) {
        WebElement element = driver.findElement(By.xpath(xpath));
        assertTrue("The element with the given XPath does not exist or is not visible.", element.isDisplayed());
    }

    @And("i select an option from the dropdown {string}")
    public void selectAnOptionFromTheDropdownLevel(String level) {
        WebElement selectElement = driver.findElement(By.xpath("//select"));
        Select dropdown = new Select(selectElement);
        dropdown.selectByVisibleText(level);
    }

    @And("switching to the new tab")
    public void switchingToTheNewTab() {
        String originalWindow = driver.getWindowHandle();

        WebElement element = driver.findElement(By.xpath("/html/body/div[1]/table/tbody/tr/td[7]/a"));
        assertTrue(element.isDisplayed());
        element.click();

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
        assertEquals("Confirmation message mismatch!", expectedMessage, actualMessage);
    }
}
