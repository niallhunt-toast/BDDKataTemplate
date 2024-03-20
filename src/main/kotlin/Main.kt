data class Item(val name: String, val quantity: Int, val price: Double)
data class EmailSummary(val grandTotal: Double?, val error: String?)

fun computeGrandTotal(items: List<Item>): Double {
   throw NotImplementedError("TODO!!! Your code goes here")
}

fun sendEmail(summary: EmailSummary): Boolean {
    if (summary.error != null || summary.grandTotal == null) {
        println("Didn't send an email because there was an error or no grand total" + summary.error)
        return false
    }

    println("Sending email with grand total of " + summary.grandTotal)
    return true
}