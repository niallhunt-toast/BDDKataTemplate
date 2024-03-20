import io.cucumber.java.en.Given
import io.cucumber.java.en.Then
import io.cucumber.java.en.When
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class Step1StepDefinitions {

    private var items = mutableListOf<Item>()
    private var grandTotal = 0.0
    private var errorOccurred = false

    @Given("a set of items")
    fun givenASetOfItems(dataTable: List<List<String>>) {
        items.clear()
        dataTable.drop(1).forEach {
            items.add(Item(it[0], it[1].toInt(), it[2].toDouble()))
        }
    }

    @When("we compute the grand total")
    fun weComputeTheGrandTotal() {
        try {
            grandTotal = computeGrandTotal(items)
            errorOccurred = false
        } catch (e: Exception) {
            errorOccurred = true
        }
    }

    @Then("we will have a grand total of {double}")
    fun weWillHaveAGrandTotalOf(expectedTotal: Double) {
        assertEquals(expectedTotal, grandTotal)
    }

    @Then("we show an error")
    fun weShowAnError() {
        assertTrue(errorOccurred)
    }

    private var emailSummary: EmailSummary = EmailSummary(null, null)

    @When("we have a computed grand total of {double}")
    fun weHaveAComputedGrandTotal(givenTotal: Double) {
        emailSummary = EmailSummary(givenTotal, null)
    }

    @Then("we send an email containing the grand total")
    fun sendAnEmailContainingTheGrandTotal() {
        assertTrue(sendEmail(emailSummary))
    }

    @When("we have an error computing the grand total")
    fun weHaveAnErrorComputingGrandTotal() {
        emailSummary = EmailSummary(null, "Error computing grand total")
    }

    @Then("we don't send an email containing the grand total")
    fun dontSendAnEmailContainingTheGrandTotal() {
        assertFalse(sendEmail(emailSummary))
    }
}